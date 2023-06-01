resource "google_sql_database_instance" "this" {
  name                = var.instance_name
  database_version    = var.dbver
  region              = var.region
  deletion_protection = "false"

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_user" "this" {
  name     = var.user_name
  instance = google_sql_database_instance.this.name
  host     = var.host
}
