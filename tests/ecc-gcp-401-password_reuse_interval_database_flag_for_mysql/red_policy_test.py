class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertIn('MYSQL', resources[0]['databaseVersion'])
        if 'databaseFlags' in resources[0]['settings']:
            base_test.assertFalse(resources[0]['settings']['databaseFlags'][0]['name']['password_reuse_interval'])
        else:
            base_test.assertFalse('databaseFlags' in resources[0]['settings'])
