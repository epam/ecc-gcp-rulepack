class PolicyTest(object):
 
    def test_resources_with_client(self, base_test, resources, local_session):
      base_test.assertEqual(len(resources), 1)
      service = 'cloudresourcemanager'
      version = 'v1'
      component = 'projects'
      cloudresourcemanager = local_session.client(service, version, component)
      roles = cloudresourcemanager.execute_command('getIamPolicy', {'resource': 'gcp-lab-custodian'})['bindings']
      for role in roles:
        if f"serviceAccount:{resources[0]['config']['serviceAccount']}" in role['members']:
          base_test.assertEqual(role['role'], 'roles/editor')