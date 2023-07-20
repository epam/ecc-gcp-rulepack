resource "google_storage_bucket" "this" {
  name     = var.bucketname
  location = "EU"
  retention_policy {
    is_locked        = true
    retention_period = 111
  }
}

resource "google_storage_bucket_access_control" "this" {
  bucket = google_storage_bucket.this.name
  role   = "READER"
  entity = "allUsers"

  depends_on = [
    google_storage_bucket.this
  ]
}
