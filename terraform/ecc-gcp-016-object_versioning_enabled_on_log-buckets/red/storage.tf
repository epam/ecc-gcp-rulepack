resource "google_storage_bucket" "this" {
  name          = "bucket_without_ver_016_red"
  location      = var.region
  force_destroy = true
}