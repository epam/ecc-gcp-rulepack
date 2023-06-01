resource "google_sql_database_instance" "this" {
  name                = var.instance_name
  region              = var.region
  database_version    = var.database_version
  deletion_protection = "false"

  settings {
    tier = var.tier
  }
}
