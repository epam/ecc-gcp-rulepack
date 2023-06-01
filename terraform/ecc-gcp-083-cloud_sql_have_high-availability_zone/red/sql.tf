resource "google_sql_database_instance" "this" {
  name                = var.instance_name
  database_version    = var.database_version
  region              = var.region
  deletion_protection = false

  settings {
    tier = var.tier
  }
}
