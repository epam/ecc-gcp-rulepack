resource "google_storage_bucket" "this" {
  name     = var.bucket_name
  location = var.region

  labels = {
    custodianrule    = "ecc-gcp-042-logging_for_cloud_storage_buckets"
    compliancestatus = "red"
  }

}