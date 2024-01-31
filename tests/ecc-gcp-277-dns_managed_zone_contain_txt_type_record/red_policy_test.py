class PolicyTest(object):
 
    def test_resources_with_client(self, base_test, resources, local_session):
      base_test.assertEqual(len(resources), 1)
      service = 'dns'
      version = 'v1'
      component = 'resourceRecordSets'
      dns_zones = local_session.client(service, version, component)
      zones = dns_zones.execute_command('list', 
               {'project': 'cloud-custodian', 'managedZone': resources[0]['name']})
      base_test.assertNotEqual(zones['rrsets'][0]['type'], 'TXT')