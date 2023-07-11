class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertNotEqual(resources[0]['purpose'],'INTERNAL_HTTPS_LOAD_BALANCER')
        base_test.assertNotEqual(resources[0]['enableFlowLogs'],'true')