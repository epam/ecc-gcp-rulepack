class PolicyTest(object):
 
    def test_resources_with_client(self, base_test, resources, local_session):
      base_test.assertEqual(len(resources), 1)
      service = 'bigtableadmin'
      version = 'v2'
      component = 'projects.instances.tables'
      instances_tables = local_session.client(service, version, component)
      tables = instances_tables.execute_command('getIamPolicy', {'resource': resources[0]['name']})
      base_test.assertRegex(tables['bindings'][0]['members'][0], r'.*serviceAccount.*')
      base_test.assertEqual(tables['bindings'][0]['role'], 'roles/editor')