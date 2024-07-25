class PolicyTest(object):
 
    def test_resources_with_client(self, base_test, resources, local_session):
      base_test.assertEqual(len(resources), 1)
      service = 'cloudfunctions'
      version = 'v1'
      component = 'projects.locations.functions'
      cloudfunctions = local_session.client(service, version, component)
      function = cloudfunctions.execute_command('getIamPolicy', {'resource': resources[0]['name']})
      base_test.assertRegex(function['bindings'][0]['members'][0], r'^.*gserviceaccount.com')
      base_test.assertEqual(function['bindings'][0]['role'], 'roles/editor')