import yaml
import pathlib
import os
import subprocess
import sys
import timer
from terraform_infra import output

def read_yaml_file(filepath: str):
    content = {}
    with open(filepath) as yaml_file:
        content = yaml.safe_load(yaml_file)
    return content

@timer.time_decorator
def custodian_run(policy_execution_outputs: dict,
                  base_dir: str,
                  output_dir: str,
                  cloud: str,
                  resource: str,
                  path: str,
                  policies: list,
                  sa: str,
                  regions: str = None):
    # Declare directories
    POLICY_DIR = base_dir + '/policies'
    OUTPUT_DIR = output_dir
    REGIONS = regions
    CLOUD = cloud
    print(f"'{resource}' policies", flush=True)


    if not REGIONS:
        REGIONS = os.getenv("AWS_DEFAULT_REGION")

    pathlib.Path(OUTPUT_DIR).mkdir(exist_ok=True)

    # Run yaml policies
    print("The cloud is " + CLOUD)
    if CLOUD != 'AWS':
        REGIONS = 'default'
    elif not REGIONS:
        print('Please use --regions param or setup the AWS_DEFAULT_REGION environment variable')
        sys.exit(1)
    regions = REGIONS.split(';')

    for region in regions:
        region_param = '--region=' + region if region != "default" else ""
        for policy in policies:
            policy_content = read_yaml_file(POLICY_DIR + "/" + policy)
            policy_resource = policy_content['policies'][0].get('resource')
            if policy_resource.startswith(f'gcp.{resource}'):
                command = (f"custodian run {POLICY_DIR}/{policy} --dry-run --output-dir={OUTPUT_DIR}/{region} \
                           --cache-period=0 {region_param if region_param else ''} \
                           {f'--assume {sa}'  if CLOUD == 'GCP' else ''}")
                process = subprocess.Popen([command], shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
                process.poll()
                name_prefix = output(path, policy_name=policy.split('.')[0], resource=policy_resource.split('.')[1])
                policy_execution_outputs[policy.split('.')[0]] = {'scan_result': process.stdout.read().decode('utf-8'), 'name': name_prefix, 'policy_resource': policy_resource.split('.')[1]}
                process.wait()
                print(f"processed {policy} policy")
    return policy_execution_outputs