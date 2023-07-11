resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.sql_name}-${random_id.this.hex}-239-green"
  database_version    = var.sql_version
  region              = var.region
  deletion_protection = false

  settings {
    disk_autoresize = true
    tier            = "db-f1-micro"

    user_labels = {
      custodianrule    = "ecc-gcp-239-sql_configured_with_storage_auto_resize_true"
      compliancestatus = "green"
    }
  }
}
