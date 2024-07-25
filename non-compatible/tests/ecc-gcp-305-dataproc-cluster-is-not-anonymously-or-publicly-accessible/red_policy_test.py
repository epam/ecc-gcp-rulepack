class PolicyTest(object):
 
    def test_resources_with_client(self, base_test, resources, local_session):
      base_test.assertEqual(len(resources), 1)
      service = 'dataproc'
      version = 'v1'
      component = 'projects.regions.clusters'
      dataproc_clusters = local_session.client(service, version, component)
      clusters = dataproc_clusters.execute_command('getIamPolicy', {'resource': f"projects/cloud-custodian/regions/us-central1/clusters/{resources[0]['clusterName']}"})['bindings']
      base_test.assertEqual(clusters[0]['members'][0], 'allAuthenticatedUsers')