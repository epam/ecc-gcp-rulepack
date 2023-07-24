resource "google_dns_managed_zone" "this" {
  name     = var.dns_zone_name
  dns_name = "dns-${random_id.rnd.hex}.com."
}

resource "random_id" "rnd" {
  byte_length = 4
}
