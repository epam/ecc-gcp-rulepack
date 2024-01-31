class PolicyTest(object):
 
    def test_resources_with_client(self, base_test, resources, local_session):
      base_test.assertEqual(len(resources), 1)
      cloudkms_keyRings = local_session.client('cloudkms', 'v1', 'projects.locations.keyRings')
      keyRings = cloudkms_keyRings.execute_command('list', {'parent': resources[0]['name']})      
      base_test.assertEqual(len(keyRings), 0)