resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.dbname}-${random_id.this.hex}-198-green"
  database_version    = var.dbver
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-198-skip_show_database_database_flag_for_mysql"
      compliancestatus = "green"
    }
    tier = var.tier
    database_flags {
      name  = "skip_show_database"
      value = "on"
    }
  }
}
