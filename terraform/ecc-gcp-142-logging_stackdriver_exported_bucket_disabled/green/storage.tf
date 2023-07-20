# The bucket that will receive log objects.
resource "google_storage_bucket" "bucket1" {
  name          = "bucket_for_logs_142_green"
  location      = var.region
  force_destroy = true
}

# This bucket is used to write logs from sink.
resource "google_storage_bucket" "bucket2" {
  name          = "bucket_with_logs_142_green"
  location      = var.region
  force_destroy = true

  logging {
    log_bucket = google_storage_bucket.bucket1.id
  }
}