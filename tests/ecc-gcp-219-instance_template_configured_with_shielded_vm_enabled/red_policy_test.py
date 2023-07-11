class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        if 'shieldedInstanceConfig' in resources[0]['properties']:
            base_test.assertFalse(resources[0]['properties']['shieldedInstanceConfig']['enableVtpm'])
            base_test.assertFalse(resources[0]['properties']['shieldedInstanceConfig']['enableIntegrityMonitoring'])
        else:
            base_test.assertFalse('shieldedInstanceConfig' in resources[0]['properties'])