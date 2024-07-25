class PolicyTest(object):
 
    def test_resources_with_client(self, base_test, resources, local_session):
      base_test.assertEqual(len(resources), 1)
      service = 'spanner'
      version = 'v1'
      component = 'projects.instances.backups'
      spanner_instances = local_session.client(service, version, component)
      instances = spanner_instances.execute_command('getIamPolicy', {'resource': resources[0]['name']})['bindings']
      base_test.assertRegex(instances[0]['members'][0], r'^.*gserviceaccount.com')
      base_test.assertEqual(instances[0]['role'], 'roles/editor')