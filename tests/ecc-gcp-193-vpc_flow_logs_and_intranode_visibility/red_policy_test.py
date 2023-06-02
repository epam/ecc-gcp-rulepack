class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        if 'enableIntraNodeVisibility' in resources[0]['networkConfig']:
            base_test.assertFalse(resources[0]['networkConfig']['enableIntraNodeVisibility'])
        else:
            base_test.assertFalse('enableIntraNodeVisibility' in resources[0]['networkConfig'])