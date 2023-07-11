class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertTrue('httpsTrigger' in resources[0])
        base_test.assertNotEqual(resources[0]['httpsTrigger']['securityLevel'], 'SECURE_ALWAYS')
        base_test.assertEqual(resources[0]['status'], 'ACTIVE')