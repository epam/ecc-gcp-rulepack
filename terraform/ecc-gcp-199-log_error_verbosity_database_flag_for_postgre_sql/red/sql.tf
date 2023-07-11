resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.sql_name}-${random_id.this.hex}-199-red"
  database_version    = var.sql_version
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-199-log_error_verbosity_database_flag_for_postgre_sql"
      compliancestatus = "red"
    }
    database_flags {
      name  = "log_error_verbosity"
      value = "terse"
    }
    tier = "db-f1-micro"
  }
}
