class PolicyTest(object):
 
   def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertEqual(len(resources[0]['roles']), 2)
        base_test.assertEqual(resources[0]['roles'][0], 'roles/iam.serviceAccountAdmin')
        base_test.assertEqual(resources[0]['roles'][1], 'roles/iam.serviceAccountUser')