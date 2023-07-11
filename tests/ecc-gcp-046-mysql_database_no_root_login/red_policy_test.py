class PolicyTest(object):
 
    def test_resources_with_client(self, base_test, resources, local_session):
      base_test.assertEqual(len(resources), 1)
      service = 'sqladmin'
      version = 'v1beta4'
      component = 'users'
      sql_user = local_session.client(service, version, component)
      user = sql_user.execute_command('list', 
               {'project': resources[0]['project'], 'instance': resources[0]['instance']})['items']
      base_test.assertEqual(user[0]['name'], 'root')
      base_test.assertIn(user[0]['host'], '0.0.0.0')