class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertEqual(resources[0]['rules'][0]['priority'], 2147483647)
        base_test.assertEqual(resources[0]['rules'][0]['action'], 'allow')