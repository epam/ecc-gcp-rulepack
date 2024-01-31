class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertNotIn('run.googleapis.com/vpc-access-connector', resources[0]['metadata']['annotations'])