class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertEqual(resources[0]['spec']['serviceAccountName'], '443732426401-compute@developer.gserviceaccount.com')
        for item in resources[0]['status']['conditions']:
            if item['type'] == 'Active':
                base_test.assertEqual(item['status'], 'True')