class PolicyTest(object):

    def test_resources_with_client(self, base_test, resources, local_session):
        base_test.assertEqual(len(resources), 1)
        GOOGLE_CLOUD_PROJECT='cloud-custodian'
        service = 'cloudresourcemanager'
        version = 'v1'
        component = 'projects'
        cloudresourcemanager = local_session.client(service, version, component)
        roles = cloudresourcemanager.execute_command('getIamPolicy', {'resource': GOOGLE_CLOUD_PROJECT})['bindings']
        for role in roles:
          if role.get("role", "")=="roles/editor":
            base_test.assertIn("serviceAccount:" + resources[0]["spec"]["serviceAccountName"], role.get("members", []))
