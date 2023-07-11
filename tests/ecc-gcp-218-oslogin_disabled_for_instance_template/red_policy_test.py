class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)     
        base_test.assertEqual(resources[0]['properties']['metadata']['items'][0]['key'], 'enable-oslogin')
        base_test.assertEqual(resources[0]['properties']['metadata']['items'][0]['value'], 'false')