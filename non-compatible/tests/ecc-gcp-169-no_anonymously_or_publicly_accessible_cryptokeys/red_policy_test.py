class PolicyTest(object):
 
    def test_resources_with_client(self, base_test, resources, local_session):
      base_test.assertEqual(len(resources), 1)
      service = 'cloudkms'
      version = 'v1'
      component = 'projects.locations.keyRings'
      cloudkms_keyRings = local_session.client(service, version, component)
      keyRings = cloudkms_keyRings.execute_command('getIamPolicy', {'resource': resources[0]['name']})['bindings']
      base_test.assertEqual(keyRings[0]['members'][0], 'allAuthenticatedUsers')