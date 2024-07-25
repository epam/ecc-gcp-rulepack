class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertEqual(resources[0]['sourceRanges'][0],'0.0.0.0/0')
        base_test.assertEqual(resources[0]['direction'],'INGRESS')
        base_test.assertEqual(resources[0]['allowed'][0]['IPProtocol'],'tcp')
        base_test.assertEqual(resources[0]['allowed'][0]['ports'][0],'110')

