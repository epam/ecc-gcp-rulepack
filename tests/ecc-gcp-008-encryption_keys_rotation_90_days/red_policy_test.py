class PolicyTest(object):
 
   def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertTrue(int(resources[0]['rotationPeriod'][:len(resources[0]['rotationPeriod'])-1]) >  7776000)
