class PolicyTest(object):
 
   def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertTrue(resources[0]['c7n:loadbalancer-backend-frontend']['c7n:loadbalancer-backend-service']['enableCDN'])
        base_test.assertEqual(resources[0]['c7n:loadbalancer-backend-frontend']['c7n:loadbalancer-backend-service']['protocol'], 'HTTPS')
        base_test.assertNotRegex(resources[0]['minTlsVersion'], r'TLS_1_[1,2]')