class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertEqual(resources[0]['settings']['databaseFlags'][0]['name'], 'log_statement_stats')
        base_test.assertEqual(resources[0]['settings']['databaseFlags'][0]['value'], 'on')