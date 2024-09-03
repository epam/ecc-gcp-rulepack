class PolicyTest(object):

    def test_resources_with_client(self, base_test, resources, local_session):
        base_test.assertEqual(len(resources), 1)
        project='cloud-custodian'
        service = 'accessapproval'
        version = 'v1'
        component = 'projects'
        cloudresourcemanager = local_session.client(service, version, component)
        accessApprovalSettings = cloudresourcemanager.execute_command('getAccessApprovalSettings', {'name': f"projects/{resources[0]['projectId']}/accessApprovalSettings"})
        base_test.assertNotIn("name", accessApprovalSettings)
        base_test.assertIn("error", accessApprovalSettings)
        base_test.assertEqual(accessApprovalSettings["error"]["status"], "NOT_FOUND")
