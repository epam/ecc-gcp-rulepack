class PolicyTest(object):
 
    def test_resources_with_client(self, base_test, resources, local_session):
        base_test.assertEqual(len(resources), 1)
        service = 'bigquery'
        version = 'v2'
        component = 'tables'
        bigquery_tables = local_session.client(service, version, component)
        tables = bigquery_tables.execute_command('get', {
                'projectId': resources[0]['tableReference']['projectId'], 'datasetId': resources[0]['tableReference']['datasetId'],
                'tableId': resources[0]['tableReference']['tableId']})
        base_test.assertFalse('encryptionConfiguration' in tables)