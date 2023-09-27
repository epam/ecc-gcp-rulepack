resource "google_bigquery_dataset" "this" {
  dataset_id = "dataset_${var.prefix}"
  location   = var.region

  labels = {
    custodianrule    = "ecc-gcp-455-bigquery_dataset_label_info"
    compliancestatus = "green"
  }
}
