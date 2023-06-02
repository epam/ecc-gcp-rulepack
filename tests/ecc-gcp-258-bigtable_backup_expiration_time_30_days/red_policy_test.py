import datetime

class PolicyTest(object):
 
   def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        for resource in resources:
            start_time_pattern = "%Y-%m-%dT%H:%M:%S.%fZ"
            expired_time_pattern = "%Y-%m-%dT%H:%M:%S.%fZ"
            expired_time = resources[0]['expireTime']
            start_time = resources[0]['startTime']

            filtered_expired_time = datetime.datetime.strptime(
                expired_time, expired_time_pattern)
            filtered_start_time = datetime.datetime.strptime(
                start_time, start_time_pattern)
            result_time = filtered_expired_time - filtered_start_time
            
            base_test.assertTrue(int(result_time.days) < 29)
