resource "google_cloudfunctions_function" "this" {
  name                  = "function-248-red"
  runtime               = "python37"
  available_memory_mb   = 128
  trigger_http          = true
  entry_point           = "hello_world"
  source_archive_bucket = google_storage_bucket.this.name
  source_archive_object = google_storage_bucket_object.this.name

  labels = {
    custodiarule     = "ecc-gcp-248-cloud_functions_configured_with_event_trigger"
    compliancestatus = "red"
  }
}
