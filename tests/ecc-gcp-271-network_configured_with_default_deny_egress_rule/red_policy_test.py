class PolicyTest(object):
 
    def test_resources_with_client(self, base_test, resources, local_session):
      base_test.assertEqual(len(resources), 1)
      service = 'compute'
      version = 'v1'
      component = 'networks'
      vpc_firewalls = local_session.client(service, version, component)
      firewalls = vpc_firewalls.execute_command('getEffectiveFirewalls', {'project': 'cloud-custodian',
                                                                      'network': resources[0]['name']})['firewalls']
      base_test.assertNotEqual(firewalls[0]['priority'], 65535)
      base_test.assertNotEqual(firewalls[0]['denied'][0]['IPProtocol'], 'all')
      base_test.assertFalse(firewalls[0]['logConfig']['enable'])
