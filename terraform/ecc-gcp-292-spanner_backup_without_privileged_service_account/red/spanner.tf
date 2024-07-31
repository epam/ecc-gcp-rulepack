resource "google_spanner_instance" "this" {
  name         = var.spanner-i
  display_name = var.spanner-i
  config       = "regional-us-central1"
  num_nodes    = 1

  labels = {
    custodianrule    = var.rule
    compliancestatus = "red"
  }
}

resource "google_spanner_database" "this" {
  instance                 = google_spanner_instance.this.name
  name                     = var.spanner-db
  version_retention_period = "1d"
  ddl = [
    "CREATE TABLE t1 (t1 INT64 NOT NULL,) PRIMARY KEY(t1)",
    "CREATE TABLE t2 (t2 INT64 NOT NULL,) PRIMARY KEY(t2)",
  ]
  deletion_protection = false
}