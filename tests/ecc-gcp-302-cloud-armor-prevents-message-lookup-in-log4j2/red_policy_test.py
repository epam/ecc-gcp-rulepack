class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertFalse("evaluatePreconfiguredExpr('cve-canary')" in resources[0]['rules'][0]['match']['expr']['expression'])
        base_test.assertEqual(resources[0]['rules'][0]['action'], 'deny(403)')