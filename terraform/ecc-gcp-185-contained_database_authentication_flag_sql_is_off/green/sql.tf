resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.sql_name}-${random_id.this.hex}-185-green"
  database_version    = var.sql_version
  region              = var.region
  deletion_protection = false
  root_password       = random_password.this.result

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-185-contained_database_authentication_flag_sql_is_off"
      compliancestatus = "green"
    }
    database_flags {
      name  = "contained database authentication"
      value = "off"
    }
    tier = "db-custom-1-3840"
  }
}

resource "random_password" "this" {
  length           = 12
  special          = true
  override_special = "_%@"
}
