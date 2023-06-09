resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.sql_name}-${random_id.this.hex}-207-green"
  database_version    = var.sql_version
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-207-log_min_error_statement-database-flag-postgresql"
      compliancestatus = "green"
    }
    database_flags {
      name  = "log_min_error_statement"
      value = "log"
    }
    tier = "db-f1-micro"
  }
}
