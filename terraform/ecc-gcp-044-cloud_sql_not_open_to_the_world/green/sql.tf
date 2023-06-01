resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.instance_name}-${random_id.this.hex}-044-green"
  region              = var.region
  database_version    = var.database_version
  deletion_protection = "false"

  settings {
    tier = var.tier
  }

}