resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.dbname}-${random_id.this.hex}-240-green"
  database_version    = var.dbver
  region              = var.region
  deletion_protection = false

  settings {
    tier = var.tier
    database_flags {
      name  = "slow_query_log"
      value = "on"
    }
  }
}
