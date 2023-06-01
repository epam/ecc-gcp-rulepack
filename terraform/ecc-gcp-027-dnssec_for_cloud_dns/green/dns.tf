resource "google_dns_managed_zone" "this" {
  name     = var.dnssec_on_name
  dns_name = var.dns_name

  dnssec_config {
    state = "on"
  }

}