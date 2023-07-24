resource "google_storage_bucket" "this" {
  name                        = var.bucket_name
  location                    = var.region
  uniform_bucket_level_access = false
}

resource "google_storage_bucket_access_control" "this" {
  bucket = google_storage_bucket.this.name
  role   = "READER"
  entity = "allAuthenticatedUsers"
}
