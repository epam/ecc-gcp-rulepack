resource "google_cloudfunctions_function" "this" {
  name                  = "function-241-green"
  runtime               = "python37"
  available_memory_mb   = 128
  trigger_http          = true
  entry_point           = "hello_world"
  source_archive_bucket = google_storage_bucket.this.name
  source_archive_object = google_storage_bucket_object.this.name

  labels = {
    custodiarule     = "ecc-gcp-241-functions_without_privileged_service_accounts"
    compliancestatus = "green"
  }
}
