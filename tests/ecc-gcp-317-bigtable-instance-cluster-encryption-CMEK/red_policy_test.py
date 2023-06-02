class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertTrue('encryptionConfig' not in resources[0] or 'kmsKeyName' not in resources[0]['encryptionConfig'])