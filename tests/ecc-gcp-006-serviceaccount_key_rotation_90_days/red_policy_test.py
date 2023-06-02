from datetime import datetime, timedelta

class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)

        valid_after_time = datetime.strptime(str(resources[0]['validAfterTime']), '%Y-%m-%dT%H:%M:%fZ')
        time_now = datetime.fromisoformat('2023-10-21T00:00:00')

        base_test.assertTrue((time_now - valid_after_time).days > 90)

    def mock_time(self):
        return 2023, 10, 21