from datetime import datetime

class PolicyTest(object):
    def mock_time(self):
        return 2024, 8, 12

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        createTime = datetime.strptime(resources[0]['createTime'], "%Y-%m-%dT%H:%M:%S.%fZ")
        time_now = datetime.now()
        delta = time_now - createTime
        base_test.assertTrue(delta.days > 90)