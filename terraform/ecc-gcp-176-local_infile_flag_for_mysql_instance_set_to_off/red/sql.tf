resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.dbname}-${random_id.this.hex}-176-red"
  database_version    = var.dbver
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-176-local_infile_flag_for_mysql_instance_set_to_off"
      compliancestatus = "red"
    }
    tier = var.tier
    database_flags {
      name  = "local_infile"
      value = "on"
    }
  }
}
