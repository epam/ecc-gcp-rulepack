class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertRegex(resources[0]['machineType'], r'.*n2d-.*$')
        base_test.assertFalse('confidentialInstanceConfig' in resources[0])