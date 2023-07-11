resource "google_bigquery_dataset" "this" {
  dataset_id                  = var.dataset
  location                    = var.region
  default_table_expiration_ms = 3600000
}