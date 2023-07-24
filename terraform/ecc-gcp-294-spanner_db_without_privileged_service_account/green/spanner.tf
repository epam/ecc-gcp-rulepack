resource "google_spanner_instance" "this" {
  name         = "spanner-instance-294-green"
  display_name = "spanner-instance-294-green"
  config       = "regional-us-central1"
  num_nodes    = 1

  labels = {
    custodianrule    = "ecc-gcp-294-spanner_db_without_privileged_service_account"
    compliancestatus = "green"
  }
}

resource "google_spanner_database" "this" {
  instance            = google_spanner_instance.this.name
  name                = "spanner-database-294-green"
  deletion_protection = false
}
