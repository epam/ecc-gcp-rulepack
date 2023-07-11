class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertTrue('-compute@developer.gserviceaccount.com' in resources[0]['properties']['serviceAccounts'][0]['email'])
        base_test.assertTrue('https://www.googleapis.com/auth/cloud-platform' in resources[0]['properties']['serviceAccounts'][0]['scopes'][0])