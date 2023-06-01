resource "google_storage_bucket" "this" {
  name                        = "bucket_with_uniform_access_175_green"
  location                    = var.region
  force_destroy               = true
  uniform_bucket_level_access = true
}
