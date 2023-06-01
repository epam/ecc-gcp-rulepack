resource "google_storage_bucket" "this" {
  name          = "bucket_without_rules_162_red"
  location      = var.region
  force_destroy = true
}
