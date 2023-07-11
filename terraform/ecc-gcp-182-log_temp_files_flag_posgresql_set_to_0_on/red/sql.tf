resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.sql_name}-${random_id.this.hex}-182-red"
  database_version    = var.sql_version
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-182-log_temp_files_flag_posgresql_set_to_0_on"
      compliancestatus = "red"
    }
    database_flags {
      name  = "log_temp_files"
      value = "-1"
    }
    tier = "db-f1-micro"
  }
}
