from datetime import datetime, timedelta

class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)

        valid_after_time = datetime.strptime(str(resources[0]['expireTime']), '%Y-%m-%dT%H:%M:%S.%f%z')
        time_now = datetime.fromisoformat('2022-10-21T00:00:00-00:00')
        base_test.assertTrue((valid_after_time - time_now).days < 7)

    def mock_time(self):
        return 2022, 10, 21