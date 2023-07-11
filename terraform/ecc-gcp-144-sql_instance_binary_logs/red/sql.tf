resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.dbname}-${random_id.this.hex}-144-red"
  database_version    = var.dbver
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-144-sql_instance_binary_logs"
      compliancestatus = "red"
    }
    tier = var.tier
    backup_configuration {
      enabled            = false
      binary_log_enabled = false
    }
  }
}
