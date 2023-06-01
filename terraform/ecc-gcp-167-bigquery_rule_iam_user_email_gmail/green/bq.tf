resource "google_bigquery_dataset" "this" {
  dataset_id = var.dataset

  labels = {
    custodianrule    = "ecc-gcp-167-bigquery_rule_iam_user_email_gmail"
    compliancestatus = "green"
  }
}
