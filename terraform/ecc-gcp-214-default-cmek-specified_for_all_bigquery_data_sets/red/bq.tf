resource "google_bigquery_dataset" "this" {
  dataset_id = var.dataset
  location   = var.region

  labels = {
    custodianrule    = "ecc-gcp-214-default-cmek-specified_for_all_bigquery_data_sets"
    compliancestatus = "red"
  }
}
