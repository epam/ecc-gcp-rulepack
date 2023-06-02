class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertIn('POSTGRES', resources[0]['databaseVersion'])
        base_test.assertEqual(resources[0]['settings']['databaseFlags'][0]['name'], 'log_temp_files')
        base_test.assertNotEqual(resources[0]['settings']['databaseFlags'][0]['value'], '0')