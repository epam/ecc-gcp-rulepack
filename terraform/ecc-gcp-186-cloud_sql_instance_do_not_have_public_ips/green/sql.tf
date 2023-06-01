resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.dbname}-${random_id.this.hex}-186-green"
  database_version    = var.dbver
  region              = var.region
  deletion_protection = false
  depends_on          = [google_service_networking_connection.this]
  settings {
    tier = var.tier
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.this.id
    }
  }
}
