resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.sql_name}-${random_id.this.hex}-201-red"
  database_version    = var.sql_version
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-201-log_statement-database_flag_for_postgre_sql"
      compliancestatus = "red"
    }
    database_flags {
      name  = "log_statement"
      value = "none"
    }
    tier = "db-f1-micro"
  }
}
