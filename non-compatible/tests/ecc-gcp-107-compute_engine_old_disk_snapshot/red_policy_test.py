class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertNotEqual(resources[0]['creationTimestamp'],'2022-12-01T05:17:41.805-08:00')
