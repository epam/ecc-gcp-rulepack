class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        for item in resources[0]['settings']['databaseFlags']:
            if item['name'] == 'cloudsql.enable_pgaudit':
                base_test.assertEqual(item['value'], 'off')