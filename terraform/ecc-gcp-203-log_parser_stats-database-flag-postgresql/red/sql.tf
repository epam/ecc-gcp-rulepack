resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.sql_name}-${random_id.this.hex}-203-red"
  database_version    = var.sql_version
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-203-log_parser_stats-database-flag-postgresql"
      compliancestatus = "red"
    }
    database_flags {
      name  = "log_parser_stats"
      value = "on"
    }
    tier = "db-f1-micro"
  }
}
