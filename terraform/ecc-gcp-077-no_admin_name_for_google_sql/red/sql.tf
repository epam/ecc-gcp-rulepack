resource "google_sql_database_instance" "this" {
  name                = var.instance_name
  database_version    = var.dbver
  region              = var.region
  deletion_protection = "false"

  settings {
    user_labels = {
      custodiarule     = "ecc-gcp-077-no_admin_name_for_google_sql"
      compliancestatus = "red"
    }
    tier = "db-f1-micro"
  }
}

resource "google_sql_user" "this" {
  name     = var.user_name
  instance = google_sql_database_instance.this.name
  host     = var.host
}
