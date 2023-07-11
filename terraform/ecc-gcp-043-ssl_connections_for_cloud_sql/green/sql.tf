resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.dbname}-${random_id.this.hex}-043-green"
  database_version    = var.dbver
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-043-ssl_connections_for_cloud_sql"
      compliancestatus = "green"
    }
    tier = var.tier
    ip_configuration {
      require_ssl = true
    }
  }

}

resource "google_sql_ssl_cert" "this" {
  common_name = "sql_ssl_cert_client_name_043_green"
  instance    = google_sql_database_instance.this.name
}
