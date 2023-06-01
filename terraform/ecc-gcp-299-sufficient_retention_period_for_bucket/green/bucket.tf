resource "google_storage_bucket" "this" {
  name     = var.bucketname
  location = var.region
  retention_policy {
    retention_period = "10000000"
  }

  labels = {
    custodianrule    = "ecc-gcp-299-sufficient_retention_period_for_bucket"
    compliancestatus = "green"
  }
}
