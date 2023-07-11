class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)     
        if 'items' in  resources[0]['properties']['metadata']:
            base_test.assertEqual(resources[0]['properties']['metadata']['items'][0]['key'], 'block-project-ssh-keys')
            base_test.assertNotEqual(resources[0]['properties']['metadata']['items'][0]['value'], 'true')
        else:
            base_test.assertFalse('items' in  resources[0]['properties']['metadata'])