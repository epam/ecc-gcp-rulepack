class PolicyTest(object):
 
    def test_resources_with_client(self, base_test, resources, local_session):
      base_test.assertEqual(len(resources), 1)
      service = 'cloudresourcemanager'
      version = 'v1'
      component = 'projects'
      cloudresourcemanager = local_session.client(service, version, component)
      auditConfigs = cloudresourcemanager.execute_command('getIamPolicy', {'resource': resources[0]['projectId']})['bindings']
      base_test.assertFalse('auditConfigs' in auditConfigs[0])