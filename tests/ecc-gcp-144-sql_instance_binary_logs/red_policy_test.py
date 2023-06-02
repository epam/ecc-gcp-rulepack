class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertTrue('MYSQL' in resources[0]['databaseVersion'])
        base_test.assertFalse(resources[0]['settings']['backupConfiguration']['binaryLogEnabled'])