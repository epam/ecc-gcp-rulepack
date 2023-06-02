class PolicyTest(object):
 
   def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertEqual(resources[0]['destinationRanges'][0], "0.0.0.0/0")
        base_test.assertEqual(resources[0]['direction'], "EGRESS")
        base_test.assertEqual(resources[0]['allowed'][0]['IPProtocol'], "all")

