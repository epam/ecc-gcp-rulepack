class PolicyTest(object):
 
    def test_resources_with_client(self, base_test, resources, local_session):
      base_test.assertEqual(len(resources), 1)
      service = 'pubsub'
      version = 'v1'
      component = 'projects.topics'
      pubsub_topics = local_session.client(service, version, component)
      topics = pubsub_topics.execute_command('getIamPolicy', {'resource': resources[0]['name']})['bindings']
      base_test.assertEqual(topics[0]['members'][0], 'allAuthenticatedUsers')