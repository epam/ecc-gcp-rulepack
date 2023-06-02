class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertFalse([item for item in resources[0]['metadata'].get('items', []) if item['key'] == 'block-project-ssh-keys' and item['value'].lower() != 'true'])
