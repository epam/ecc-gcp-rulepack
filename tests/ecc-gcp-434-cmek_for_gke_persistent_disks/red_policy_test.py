class PolicyTest(object):
 
   def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertNotIn('bootDiskKmsKey', resources[0]['nodePools'][0]['config'])
        base_test.assertEqual(resources[0]['nodePools'][0]['config']['diskType'], 'pd-standard')