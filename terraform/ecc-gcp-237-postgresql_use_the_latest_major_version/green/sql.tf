resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.instance_name}-${random_id.this.hex}"
  database_version    = var.database_version
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-237-postgresql_use_the_latest_major_version"
      compliancestatus = "green"
    }
    tier = "db-f1-micro"
  }
}
