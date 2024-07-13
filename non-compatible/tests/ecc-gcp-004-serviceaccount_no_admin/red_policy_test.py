class PolicyTest(object):
 
   def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertEqual(resources[0]['member'], 'serviceAccount:service-account-id-004-red@gcp-lab-custodian.iam.gserviceaccount.com')
        base_test.assertEqual(resources[0]['roles'], ['roles/editor'])