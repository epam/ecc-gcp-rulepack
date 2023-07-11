resource "google_dns_managed_zone" "this" {
  name     = var.name
  dns_name = var.dns_name

  dnssec_config {
    default_key_specs {
      algorithm  = "ecdsap256sha256"
      key_length = 2048
      key_type   = "keySigning"
    }

    default_key_specs {
      algorithm  = "ecdsap256sha256"
      key_length = 2048
      key_type   = "zoneSigning"
    }
  }

}