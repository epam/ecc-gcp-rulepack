resource "google_sql_database_instance" "this" {
  name                = var.dbname
  database_version    = var.dbver
  region              = var.region
  deletion_protection = false

  settings {
    tier = var.tier
    backup_configuration {
      enabled = true
    }
  }
}
