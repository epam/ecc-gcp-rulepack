resource "google_bigquery_dataset" "this" {
  dataset_id = "dataset_${var.prefix}"
  location   = var.region

  labels = {
    custodianrule    = "ecc-gcp-457-bigquery_table_label_info"
    compliancestatus = "red"
  }
}

resource "google_bigquery_table" "this" {
  dataset_id = google_bigquery_dataset.this.dataset_id
  table_id   = "table_${var.prefix}"
  deletion_protection = false

  labels = {}

}