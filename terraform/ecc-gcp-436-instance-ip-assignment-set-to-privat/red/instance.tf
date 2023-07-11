resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "instance" {
  provider = google-beta

  name                = "instance-${random_id.db_name_suffix.hex}-436-red"
  region              = var.region
  database_version    = var.dbver
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-436-instance-ip-assignment-set-to-privat"
      compliancestatus = "red"
    }
    tier = var.tier
  }
}
