class PolicyTest(object):
 
   def test_resources(self, base_test, resources):
      base_test.assertEqual(len(resources), 1)
      if 'logging' in resources[0]:
         base_test.assertIsNotNone(resources[0]['logging']['logObjectPrefix'])