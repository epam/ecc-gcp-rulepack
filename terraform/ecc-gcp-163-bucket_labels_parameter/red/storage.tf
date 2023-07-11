resource "google_storage_bucket" "this" {
  name     = var.bucket_name
  location = var.region
  labels   = {}
}