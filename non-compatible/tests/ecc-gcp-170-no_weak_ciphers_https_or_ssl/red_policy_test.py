class PolicyTest(object):
 
   def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertNotEqual(resources[0]['profile'], 'MODERN')
        base_test.assertNotRegex(resources[0]['minTlsVersion'], r'TLS_1_[0,1]')
        base_test.assertNotEqual(resources[0]['profile'], 'RESTRICTED')
        base_test.assertNotEqual(resources[0]['profile'], 'CUSTOM')
        base_test.assertFalse('customFeatures' in resources[0])