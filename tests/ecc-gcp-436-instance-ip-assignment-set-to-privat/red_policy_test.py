class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        for address in resources[0]['ipAddresses']:
            base_test.assertNotEqual(address['type'], 'PRIVATE')
