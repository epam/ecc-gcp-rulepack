class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertIn('SQLSERVER', resources[0]['databaseVersion'])
        base_test.assertEqual(resources[0]['settings']['databaseFlags'][0]['name'], 'contained database authentication')
        base_test.assertNotEqual(resources[0]['settings']['databaseFlags'][0]['value'], 'off')