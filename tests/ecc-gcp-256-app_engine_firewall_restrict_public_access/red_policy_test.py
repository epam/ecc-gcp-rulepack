class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertEqual(resources[0]['action'], 'ALLOW')
        base_test.assertNotEqual(resources[0]['priority'], 2147483647)
        base_test.assertEqual(resources[0]['sourceRange'], '0.0.0.0/0')