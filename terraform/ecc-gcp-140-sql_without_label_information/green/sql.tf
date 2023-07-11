resource "google_sql_database_instance" "this" {
  name                = var.sql_name
  database_version    = var.sql_version
  region              = var.region
  deletion_protection = false

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-140-sql_without_label_information"
      compliancestatus = "green"
    }
    tier = "db-f1-micro"
  }
}
