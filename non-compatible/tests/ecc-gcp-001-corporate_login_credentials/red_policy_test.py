class PolicyTest(object):
 
   def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertRegex(resources[0]['member'], r'([a-zA-Z0-9:\"\._-]*?)@(?!(epam\.com)|(([a-z0-9\.-]+?)\.gserviceaccount\.com))([a-z\.-]+?)')