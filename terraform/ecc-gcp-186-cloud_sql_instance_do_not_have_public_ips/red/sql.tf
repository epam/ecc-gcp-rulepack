resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.dbname}-${random_id.this.hex}-186-red"
  database_version    = var.dbver
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-186-cloud_sql_instance_do_not_have_public_ips"
      compliancestatus = "red"
    }
    tier = var.tier
    ip_configuration {
      ipv4_enabled = true
    }
  }
}
