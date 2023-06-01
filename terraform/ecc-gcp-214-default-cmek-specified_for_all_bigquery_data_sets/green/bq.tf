resource "google_bigquery_dataset" "this" {
  dataset_id                  = var.dataset
  location                    = var.region
  default_table_expiration_ms = 3600000

  default_encryption_configuration {
    kms_key_name = google_kms_crypto_key.this.id
  }

  labels = {
    custodianrule    = "ecc-gcp-214-default-cmek-specified_for_all_bigquery_data_sets"
    compliancestatus = "green"
  }
}
