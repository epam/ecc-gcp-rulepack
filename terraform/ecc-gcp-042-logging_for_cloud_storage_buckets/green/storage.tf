resource "google_storage_bucket" "this" {
  name     = var.bucket_name
  location = var.region

  logging {
    log_bucket = var.log_bucket_name
  }

  labels = {
    custodianrule    = "ecc-gcp-042-logging_for_cloud_storage_buckets"
    compliancestatus = "green"
  }

}