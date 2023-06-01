resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  provider = google-beta

  name             = "instance-${random_id.this.hex}-436-red"
  region           = var.region
  database_version = var.dbver
  deletion_protection = false

  settings {
    tier = var.tier
    }
}
