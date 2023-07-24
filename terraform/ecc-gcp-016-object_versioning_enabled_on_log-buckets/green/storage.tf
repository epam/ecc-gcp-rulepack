resource "google_storage_bucket" "this" {
  name          = "bucket_with_ver_016_green"
  location      = var.region
  force_destroy = true

  versioning {
    enabled = true
  }

}
