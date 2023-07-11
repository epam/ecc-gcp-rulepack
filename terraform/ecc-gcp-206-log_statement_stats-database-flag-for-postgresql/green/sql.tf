resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.sql_name}-${random_id.this.hex}-206-green"
  database_version    = var.sql_version
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-206-log_statement_stats-database-flag-for-postgresql"
      compliancestatus = "green"
    }
    database_flags {
      name  = "log_statement_stats"
      value = "off"
    }
    tier = "db-f1-micro"
  }
}
