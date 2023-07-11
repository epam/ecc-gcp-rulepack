resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.dbname}-${random_id.this.hex}-240-red"
  database_version    = var.dbver
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-240-slow_query_log_database_flag_for_cloud_sql_mysql"
      compliancestatus = "red"
    }
    tier = var.tier
  }
}
