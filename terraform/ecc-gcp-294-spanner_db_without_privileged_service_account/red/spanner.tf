resource "google_spanner_instance" "this" {
  name         = "spanner-instance-294-red"
  display_name = "spanner-instance-294-red"
  config       = "regional-us-central1"
  num_nodes    = 1

  labels = {
    custodianrule    = "ecc-gcp-294-spanner_db_without_privileged_service_account"
    compliancestatus = "red"
  }
}

resource "google_spanner_database" "this" {
  instance            = google_spanner_instance.this.name
  name                = "spanner-database-294-red"
  deletion_protection = false
}
