resource "google_storage_bucket" "this" {
  name          = "bucket_with_logs_142_red"
  location      = var.region
  force_destroy = true
}