resource "google_storage_bucket" "this" {
  name     = var.bucket_name
  location = var.region

  labels = {
    custodianrule    = "ecc-gcp-079-google_cloud_storage_not_host_static_website"
    compliancestatus = "green"
  }
}
