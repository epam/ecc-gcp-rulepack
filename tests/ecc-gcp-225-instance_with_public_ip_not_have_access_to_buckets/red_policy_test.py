class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertEqual(resources[0]['networkInterfaces'][0]['accessConfigs'][0]['name'], 'external-nat')
        base_test.assertEqual(resources[0]['serviceAccounts'][0]['scopes'][0], 'https://www.googleapis.com/auth/cloud-platform')