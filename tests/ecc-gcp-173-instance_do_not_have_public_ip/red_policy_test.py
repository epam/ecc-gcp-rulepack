class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertIn('external-nat', resources[0]['networkInterfaces'][0]['accessConfigs'][0]['name'])
        base_test.assertNotIn('gke', resources[0]['name'])
        base_test.assertFalse('goog-gke-node' in resources[0]['labels'])