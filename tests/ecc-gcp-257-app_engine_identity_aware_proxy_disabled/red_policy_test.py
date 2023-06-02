class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertEqual(resources[0]['servingStatus'], 'SERVING')
        base_test.assertFalse('enabled' in resources[0]['iap'])