resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.dbname}-${random_id.this.hex}-401-green"
  database_version    = var.dbver
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-401-password_reuse_interval_database_flag_for_mysql"
      compliancestatus = "green"
    }
    tier = var.tier
    database_flags {
      name  = "password_reuse_interval"
      value = "365"
    }
  }
}
