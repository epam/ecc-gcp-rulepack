class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        count = 0
        for key, value in resources[0]['labels'].items():
            if not key.startswith("goog-dataproc-"):
                count += 1
        base_test.assertTrue(count == 0)
