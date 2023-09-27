resource "google_bigquery_dataset" "this" {
  dataset_id = "dataset_${var.prefix}"
  location   = var.region

  labels = {}
}
