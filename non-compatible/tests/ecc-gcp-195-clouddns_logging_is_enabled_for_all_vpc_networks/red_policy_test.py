class PolicyTest(object):
 
    def test_resources_with_client(self, base_test, resources, local_session):
        base_test.assertEqual(len(resources), 1)
        service = 'dns'
        version = 'v1beta2'
        component = 'policies'
        vpc_dns_policy = local_session.client(service, version, component)
        dns_policies = vpc_dns_policy.execute_command('list', {'project': 'gcp-lab-custodian'})
        base_test.assertFalse(dns_policies['policies'][0]['enableLogging'])     