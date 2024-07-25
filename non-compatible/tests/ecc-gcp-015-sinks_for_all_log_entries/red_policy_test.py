class PolicyTest(object):
 
    def test_resources_with_client(self, base_test, resources, local_session):
      base_test.assertEqual(len(resources), 1)
      service = 'logging'
      version = 'v2'
      component = 'projects.sinks'
      logging = local_session.client(service, version, component)
      sinks = logging.execute_command('list', {'parent': f"projects/{resources[0]['projectId']}"})['sinks']
      base_test.assertTrue(all(['filter' in sink for sink in sinks]))