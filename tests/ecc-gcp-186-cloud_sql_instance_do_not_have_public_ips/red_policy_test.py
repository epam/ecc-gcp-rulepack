class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertIn('PRIMARY', resources[0]['ipAddresses'][0]['type'])