resource "google_sql_database_instance" "this" {
  name                = var.instance_name
  region              = var.region
  database_version    = var.database_version
  deletion_protection = "false"

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-236-mysql_use_the_latest_major_version"
      compliancestatus = "green"
    }
    tier = var.tier
  }
}
