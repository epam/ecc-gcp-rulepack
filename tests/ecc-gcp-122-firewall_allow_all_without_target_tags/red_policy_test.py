class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertEqual(resources[0]['allowed'][0]['IPProtocol'],'all')
        base_test.assertNotIn('targetTags',resources[0])
