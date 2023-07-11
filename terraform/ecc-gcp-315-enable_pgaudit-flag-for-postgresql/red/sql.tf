resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.sql_name}-${random_id.this.hex}-315-red"
  database_version    = var.sql_version
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-315-enable_pgaudit-flag-for-postgresql"
      compliancestatus = "red"
    }
    database_flags {
      name  = "cloudsql.enable_pgaudit"
      value = "off"
    }
    tier = "db-f1-micro"
  }
}
