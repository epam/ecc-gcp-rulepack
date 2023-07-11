resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.sql_name}-${random_id.this.hex}-177-red"
  database_version    = var.sql_version
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-177-log_checkpoints_flag_for_postgresql_set_to_on"
      compliancestatus = "red"
    }
    database_flags {
      name  = "log_checkpoints"
      value = "off"
    }
    tier = "db-f1-micro"
  }
}
