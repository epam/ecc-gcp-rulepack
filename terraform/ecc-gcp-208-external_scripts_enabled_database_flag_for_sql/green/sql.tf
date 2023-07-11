resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.dbname}-${random_id.this.hex}-208-green"
  database_version    = var.dbver
  region              = var.region
  deletion_protection = false
  root_password       = random_password.this.result

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-208-external_scripts_enabled_database_flag_for_sql"
      compliancestatus = "green"
    }
    tier = var.tier
  }
}

resource "random_password" "this" {
  length           = 12
  special          = true
  override_special = "_%@"
}
