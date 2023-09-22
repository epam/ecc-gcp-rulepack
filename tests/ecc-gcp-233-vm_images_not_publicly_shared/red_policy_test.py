class PolicyTest(object):

    def test_resources_with_client(self, base_test, resources, local_session):
      base_test.assertEqual(len(resources), 1)
      service = 'compute'
      version = 'v1'
      component = 'images'
      compute_images = local_session.client(service, version, component)
      image = compute_images.execute_command('getIamPolicy', {'project': 'cloud-custodian', 'resource': resources[0]['name']})
      base_test.assertEqual(image['bindings'][0]['members'][0], 'allAuthenticatedUsers')
