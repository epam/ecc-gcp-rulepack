class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertIn('-compute@developer.gserviceaccount.com', resources[0]['serviceAccounts'][0]['email'])
        base_test.assertNotIn('gke', resources[0]['disks'][0]['licenses'][0])