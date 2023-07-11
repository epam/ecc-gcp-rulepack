resource "google_sql_database_instance" "this" {
  name                = var.dbname
  database_version    = var.dbver
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-082-cloud_sql_retention_policy_is_at_least_7_days"
      compliancestatus = "green"
    }
    tier = var.tier
    backup_configuration {
      enabled = true
    }
  }
}
