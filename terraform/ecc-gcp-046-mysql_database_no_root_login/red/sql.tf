resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.dbname}-${random_id.this.hex}-046-red"
  database_version    = var.dbver
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-046-mysql_database_no_root_login"
      compliancestatus = "red"
    }
    tier = var.tier
  }
}

resource "google_sql_user" "users" {
  name     = "root"
  instance = google_sql_database_instance.this.name
  host     = "0.0.0.0"
}
