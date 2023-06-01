resource "google_cloudfunctions_function" "this" {
  name                  = "function-248-green"
  runtime               = "python37"
  available_memory_mb   = 128
  entry_point           = "hello_world"
  source_archive_bucket = google_storage_bucket.this.name
  source_archive_object = google_storage_bucket_object.this.name

  event_trigger {
    event_type = "google.storage.object.finalize"
    resource   = google_storage_bucket.this.name
  }

  labels = {
    custodiarule     = "ecc-gcp-248-cloud_functions_configured_with_event_trigger"
    compliancestatus = "green"
  }
}
