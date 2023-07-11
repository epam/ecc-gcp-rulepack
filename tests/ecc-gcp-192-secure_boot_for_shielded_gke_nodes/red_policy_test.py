class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        if 'enableSecureBoot' in resources[0]['nodeConfig']['shieldedInstanceConfig']:
            base_test.assertFalse(resources[0]['nodeConfig']['shieldedInstanceConfig']['enableIntegrityMonitoring'])
        else:
            base_test.assertFalse('enableSecureBoot' in resources[0]['nodeConfig']['shieldedInstanceConfig'])