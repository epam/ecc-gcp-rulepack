resource "google_dns_managed_zone" "this" {
  name     = module.naming.resource_prefix.dns_zone
  dns_name = "test.ecc.com."

  dnssec_config {
    state = "off"
  }
}