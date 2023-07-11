class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertTrue([item for item in resources[0]['metadata'].get('items', []) if item['key'] == 'serial-port-enable' and item['value'].lower() == 'true'])
