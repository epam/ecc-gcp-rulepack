resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.dbname}-${random_id.this.hex}-473-green"
  database_version    = var.dbver
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-473-configured_automatic_storage_increase_limit"
      compliancestatus = "green"
    }
    tier                  = var.tier
    disk_autoresize_limit = 10
  }
}
