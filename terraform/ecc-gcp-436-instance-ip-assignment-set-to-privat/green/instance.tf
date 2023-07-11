resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "instance" {
  provider = google-beta

  name                = "private-instance-${random_id.db_name_suffix.hex}-436-green"
  region              = var.region
  database_version    = var.dbver
  deletion_protection = false

  depends_on = [google_service_networking_connection.private_vpc_connection]

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-436-instance-ip-assignment-set-to-privat"
      compliancestatus = "green"
    }
    tier = var.tier
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.private_network.id
    }
  }
}
