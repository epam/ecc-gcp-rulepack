import scan
import argparse
import report
from terraform_infra import green_red_infrastructures_up_down
import os
import sys

parser = argparse.ArgumentParser()

parser.add_argument('--cloud', choices=['GCP', 'Azure', 'AWS', 'OpenStack', 'Kubernetes'], help="Choose a Cloud", type=str, required=True)
parser.add_argument('--infra_color', choices=['green', 'red'], help="Choose an infrastructure", type=str, required=True)
parser.add_argument('-l','--resource_priority_list', type=str, help='resource priority list', required=True)
parser.add_argument('--base_dir', type=str, help='BASE_DIR path to the the rulepack repository ', required=True)
parser.add_argument('--output_dir', type=str, help='OUTPUT_DIR path to the the report results', required=True)
parser.add_argument('--regions', help="Please use ';' as separator", type=str)
parser.add_argument('--sa', help="Service Account for scanning", type=str, default="")
args = parser.parse_args()

resource_priority_list = args.resource_priority_list.split(',')
policy_execution_outputs = {}
RULEPACK_PATH = f"{os.environ['CORE_TESTING_FOLDER']}"
RULEPACK_TESTING_PATH = f"{os.environ['CORE_TESTING_FOLDER']}/policy_testing"


def tf_up(resource, path):
    print(f"\nTerraform apply '{args.cloud.lower()}.{resource}...'\n")
    tf_up_subprocess_result = green_red_infrastructures_up_down(
        path,
        args.infra_color,
        up=True)
    return tf_up_subprocess_result


def tf_down(resource, path):
    print(f"\nTerraform destroy '{args.cloud.lower()}.{resource}...'\n")
    tf_down_subprocess_result = green_red_infrastructures_up_down(
        path,
        args.infra_color,
        down=True,
        remove=True)
    return tf_down_subprocess_result


def common_tf_up():
    print("\nTerraform apply common resources\n")
    tf_up_common_subprocess_result = green_red_infrastructures_up_down(
        f'{RULEPACK_TESTING_PATH}/{args.infra_color}/common_resources',
        args.infra_color,
        up=True)
    return tf_up_common_subprocess_result


def common_tf_down():
    print("\nTerraform destroy common resources\n")
    tf_down_common_subprocess_result = green_red_infrastructures_up_down(
        f'{RULEPACK_TESTING_PATH}/{args.infra_color}/common_resources',
        args.infra_color,
        down=True,
        remove=True)
    return tf_down_common_subprocess_result


def main():
    # Load yaml file names
    policies = sorted([file for file in os.listdir(RULEPACK_PATH + '/policies') if file.endswith('.yml') or file.endswith('.yaml')])
    tf_up_common_subprocess_result, tf_common_error = common_tf_up()
    if tf_up_common_subprocess_result:
        for resource in resource_priority_list:
            path = f'{RULEPACK_TESTING_PATH}/{args.infra_color}/{resource}'
            #
            tf_up_subprocess_result, tf_error = tf_up(resource, path)
            if tf_up_subprocess_result:
                print("\nScan resources\n")
                try:
                    policy_execution_outputs.update(scan.custodian_run(
                        policy_execution_outputs,
                        base_dir=RULEPACK_PATH,
                        output_dir=args.output_dir,
                        cloud=args.cloud,
                        resource=resource,
                        path=path,
                        policies=policies,
                        sa=args.sa))
                except Exception as error:
                    print("An exception occurred:", error)
                #
                tf_down_subprocess_result = tf_down(resource, path)
            else:
                print(tf_error)
                tf_down_subprocess_result = tf_down(resource, path)
        if tf_up_subprocess_result:
            tf_down_common_subprocess_result = common_tf_down()
            report.create_report(
                policy_execution_outputs,output_dir=args.output_dir,
                infra_color=args.infra_color,
                cloud=args.cloud)
        else:
            tf_down_common_subprocess_result = common_tf_down()
            sys.exit(1)
    else:
        print(tf_common_error)
        tf_down_common_subprocess_result = common_tf_down()
        sys.exit(1)

if __name__ == "__main__":
    main()