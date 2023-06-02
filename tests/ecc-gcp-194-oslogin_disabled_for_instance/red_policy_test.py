class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertEqual(resources[0]['metadata']['items'][0]['key'], 'enable-oslogin')
        base_test.assertEqual(resources[0]['metadata']['items'][0]['value'], 'FALSE')
        base_test.assertNotIn('gke', resources[0]['name'])
        base_test.assertFalse('goog-gke-node' in resources[0]['labels'])