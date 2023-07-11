class PolicyTest(object):
 
   def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertEqual(resources[0]['visibility'], "public")
        base_test.assertNotEqual(resources[0]['dnssecConfig']['state'], "on")