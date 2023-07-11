class PolicyTest(object):
 
   def test_resources(self, base_test, resources):
      base_test.assertEqual(len(resources), 1)
      base_test.assertEqual(resources[0]['settings']['ipConfiguration']['authorizedNetworks'][0]['value'], '0.0.0.0/0')