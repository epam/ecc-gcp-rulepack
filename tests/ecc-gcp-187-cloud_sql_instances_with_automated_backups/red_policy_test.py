class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertFalse(resources[0]['settings']['backupConfiguration']['enabled'])
        base_test.assertNotIn('masterInstanceName', resources[0])