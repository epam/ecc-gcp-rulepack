resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.sql_name}-${random_id.this.hex}-183-red"
  database_version    = var.sql_version
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-183-log_min_duration_statement_flag_postgresql_is_-1"
      compliancestatus = "red"
    }
    database_flags {
      name  = "log_min_duration_statement"
      value = "1"
    }
    tier = "db-f1-micro"
  }
}
