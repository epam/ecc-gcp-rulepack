class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertFalse('customerManagedEncryption' in resources[0]['replication']['automatic'])