class PolicyTest(object):
 
   def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertIn(resources[0]['dnssecConfig']['defaultKeySpecs'][0]['keyType'], "keySigning")
        base_test.assertIn(resources[0]['dnssecConfig']['defaultKeySpecs'][0]['algorithm'], "rsasha1")