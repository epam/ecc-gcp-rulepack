resource "google_storage_bucket" "this" {
  name          = var.bucket_name
  location      = var.location
  force_destroy = true
  storage_class = var.storage_class

  labels = {
    custodianrule    = "ecc-gcp-189-multi_region_cloud_storage"
    compliancestatus = "green"
  }
}
