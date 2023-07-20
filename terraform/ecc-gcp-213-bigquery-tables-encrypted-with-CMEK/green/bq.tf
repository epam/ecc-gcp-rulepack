resource "google_bigquery_dataset" "this" {
  dataset_id = var.dataset
  location   = var.region

  labels = {
    custodianrule    = "ecc-gcp-213-bigquery-tables-encrypted-with-cmek"
    compliancestatus = "green"
  }
}

resource "google_bigquery_table" "this" {
  dataset_id          = google_bigquery_dataset.this.dataset_id
  table_id            = var.table
  deletion_protection = false

  encryption_configuration {
    kms_key_name = google_kms_crypto_key.this.id
  }

  labels = {
    custodianrule    = "ecc-gcp-213-bigquery-tables-encrypted-with-cmek"
    compliancestatus = "red"
  }

  depends_on = [google_kms_crypto_key_iam_binding.this]
}
