resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.sql_name}-${random_id.this.hex}-180-green"
  database_version    = var.sql_version
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-180-log_lock_waits_flag_for_postgresql_set_to_on"
      compliancestatus = "green"
    }
    database_flags {
      name  = "log_lock_waits"
      value = "on"
    }
    tier = "db-f1-micro"
  }
}
