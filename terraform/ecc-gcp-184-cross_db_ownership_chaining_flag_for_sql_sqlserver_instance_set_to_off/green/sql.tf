resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.sql_name}-${random_id.this.hex}-184-green"
  database_version    = var.sql_version
  region              = var.region
  deletion_protection = false
  root_password       = random_password.this.result

  settings {
    database_flags {
      name  = "cross db ownership chaining"
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