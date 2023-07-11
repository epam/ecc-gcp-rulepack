class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertTrue(resources[0]['nodePools'][0]['management']['autoUpgrade'])
        base_test.assertTrue(resources[0]['nodePools'][0]['initialNodeCount'] < 3)

