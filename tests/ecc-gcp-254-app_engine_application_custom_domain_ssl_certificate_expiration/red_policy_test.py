from datetime import datetime, timedelta

class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)

        valid_after_time = datetime.strptime(str(resources[0]['expireTime']), '%Y-%m-%dT%H:%M:%SZ')
        time_now = datetime.fromisoformat('2023-01-16T00:00:00')
        base_test.assertTrue((valid_after_time - time_now).days < 30)

    def mock_time(self):
        return 2023, 1, 16