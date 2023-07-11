resource "google_bigquery_dataset" "this" {
  dataset_id = var.dataset

  labels = {
    custodianrule    = "ecc-gcp-188-bq_datasets_are_not_anon_or_pub_accessible"
    compliancestatus = "red"
  }
}

resource "google_bigquery_dataset_iam_member" "this" {
  dataset_id = google_bigquery_dataset.this.dataset_id
  role       = "roles/bigquery.dataViewer"
  member     = var.iam
}
