resource "google_sql_database_instance" "this" {
  name                = var.instance_name
  database_version    = var.database_version
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-083-cloud_sql_have_high-availability_zone"
      compliancestatus = "green"
    }
    tier              = var.tier
    availability_type = "REGIONAL"
    backup_configuration {
      enabled            = "true"
      binary_log_enabled = "true"
    }
  }
}
