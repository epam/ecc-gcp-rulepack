resource "google_cloudfunctions_function" "this" {
  name                  = "function-242-red"
  runtime               = "python37"
  available_memory_mb   = 128
  trigger_http          = true
  entry_point           = "hello_world"
  source_archive_bucket = google_storage_bucket.this.name
  source_archive_object = google_storage_bucket_object.this.name

  labels = {
    custodiarule     = "ecc-gcp-242-cloud_functions_restrict_public_access"
    compliancestatus = "red"
  }
}
