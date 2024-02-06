class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertNotEqual(resources[0]['currentNodeVersion'],['1.28.5-gke.1217000'])
        base_test.assertEqual(resources[0]['releaseChannel']['channel'],'REGULAR')
