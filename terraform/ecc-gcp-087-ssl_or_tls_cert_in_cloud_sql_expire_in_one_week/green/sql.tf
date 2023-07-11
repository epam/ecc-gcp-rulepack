resource "google_sql_database_instance" "this" {
  name                = var.instance_name
  database_version    = var.dbver
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-087-ssl_or_tls_cert_in_cloud_sql_expire_in_one_week"
      compliancestatus = "green"
    }
    tier = var.tier
  }
}
