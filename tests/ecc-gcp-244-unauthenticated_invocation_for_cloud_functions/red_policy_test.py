class PolicyTest(object):
 
   def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertNotEqual(len(resources[0]['c7n:MatchedFilters']), 0)
        base_test.assertIn("roles/cloudfunctions.invoker", resources[0]['c7n:iamPolicy']['bindings'][0]['role'])
        base_test.assertIn("allUsers", resources[0]['c7n:iamPolicy']['bindings'][0]['members'])