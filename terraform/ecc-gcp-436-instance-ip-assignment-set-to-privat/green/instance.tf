resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  provider = google-beta

  name             = "private-instance-${random_id.this.hex}-436-green"
  region           = var.region
  database_version = var.dbver
  deletion_protection = false

  depends_on = [google_service_networking_connection.this]

  settings {
    tier = var.tier
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.this.id
    }
  }
}
