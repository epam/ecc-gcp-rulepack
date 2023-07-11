resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.dbname}-${random_id.this.hex}-187-green"
  database_version    = var.dbver
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-187-cloud_sql_instances_with_automated_backups"
      compliancestatus = "green"
    }
    tier = var.tier
    backup_configuration {
      enabled = true
    }
  }
}
