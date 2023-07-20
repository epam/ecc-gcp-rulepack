resource "google_bigquery_dataset" "this" {
  dataset_id = var.dataset
  location   = var.region

  labels = {
    custodianrule    = "ecc-gcp-213-bigquery-tables-encrypted-with-cmek"
    compliancestatus = "red"
  }
}

resource "google_bigquery_table" "this" {
  dataset_id          = google_bigquery_dataset.this.dataset_id
  table_id            = var.table
  deletion_protection = false

  labels = {
    custodianrule    = "ecc-gcp-213-bigquery-tables-encrypted-with-cmek"
    compliancestatus = "red"
  }
}
