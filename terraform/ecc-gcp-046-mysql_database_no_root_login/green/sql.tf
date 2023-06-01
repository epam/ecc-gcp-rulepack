resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.dbname}-${random_id.this.hex}-046-green"
  database_version    = var.dbver
  region              = var.region
  deletion_protection = false

  settings {
    tier = var.tier
  }
}

resource "google_sql_user" "this" {
  name     = "root"
  instance = google_sql_database_instance.this.name
  host     = "256.256.256.0"
}