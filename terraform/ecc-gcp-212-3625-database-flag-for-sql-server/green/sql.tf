resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.dbname}-${random_id.this.hex}-212-green"
  database_version    = var.dbver
  region              = var.region
  deletion_protection = false
  root_password       = random_password.this.result
  settings {
    tier = var.tier
    database_flags {
      name  = "3625"
      value = "on"
    }
  }
}

resource "random_password" "this" {
  length           = 12
  special          = true
  override_special = "_%@"
}
