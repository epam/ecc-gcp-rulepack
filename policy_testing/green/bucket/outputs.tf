output "bucket" {
  value = {
    bucket = google_storage_bucket.this.self_link
  }
}