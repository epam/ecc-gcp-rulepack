class PolicyTest(object):
 
    def test_resources_with_client(self, base_test, resources, local_session):
      base_test.assertEqual(len(resources), 1)
      logging_client = local_session.client('logging', 'v2', 'projects.metrics')
      metrics = logging_client.execute_command('list', {'parent': f"projects/{resources[0]['projectId']}"})['metrics']      
      base_test.assertNotEqual(metrics[0]['filter'], 'protoPayload.methodName=\"SetIamPolicy\" AND protoPayload.serviceData.policyDelta.auditConfigDeltas:*')