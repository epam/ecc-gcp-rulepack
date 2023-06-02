class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertNotEqual(resources[0]['currentMasterVersion'],['1.25.6-gke.1000'])
        base_test.assertEqual(resources[0]['releaseChannel']['channel'],'REGULAR')
