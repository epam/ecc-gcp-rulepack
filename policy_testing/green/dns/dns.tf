resource "google_dns_managed_zone" "this" {
  name     = module.naming.resource_prefix.dns_zone
  dns_name = "test.ecc.com."

  dnssec_config {
    state = "on"

    default_key_specs {
      algorithm  = "ecdsap256sha256"
      key_length = 256
      key_type   = "keySigning"
    }

    default_key_specs {
      algorithm  = "ecdsap256sha256"
      key_length = 256
      key_type   = "zoneSigning"
    }
  }
}

resource "google_dns_record_set" "this" {
  name         = "frontend.${google_dns_managed_zone.this.dns_name}"
  type         = "TXT"
  ttl          = 300
  managed_zone = google_dns_managed_zone.this.name
  rrdatas      = ["dns"]
}