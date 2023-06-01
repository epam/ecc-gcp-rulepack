resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.sql_name}-${random_id.this.hex}-180-red"
  database_version    = var.sql_version
  region              = var.region
  deletion_protection = false

  settings {
    database_flags {
      name  = "log_lock_waits"
      value = "off"
    }
    tier = "db-f1-micro"
  }
}
