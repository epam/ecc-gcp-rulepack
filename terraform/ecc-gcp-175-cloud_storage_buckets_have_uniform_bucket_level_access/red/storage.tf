resource "google_storage_bucket" "this" {
  name          = "bucket_with_uniform_access_175_red"
  location      = var.region
  force_destroy = true
}
