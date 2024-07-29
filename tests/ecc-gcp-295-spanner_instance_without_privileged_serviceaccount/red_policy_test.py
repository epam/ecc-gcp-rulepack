class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertIn("roles/editor", resources[0]['c7n:iamPolicy']['bindings'][0]['role'])
        base_test.assertRegex(";".join(resources[0]['c7n:iamPolicy']['bindings'][0]['members']), r'^.*gserviceaccount.com.*')