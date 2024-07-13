class PolicyTest(object):
 
    def test_resources_with_client(self, base_test, resources, local_session):
        base_test.assertEqual(len(resources), 1)
        service = 'iam'
        version = 'v1'
        component = 'roles'
        iam_roles = local_session.client(service, version, component)
        roles = iam_roles.execute_command('get', {'name': resources[0]['roles'][0]})['includedPermissions']
        base_test.assertTrue('iam.serviceAccounts.actAs' in roles)