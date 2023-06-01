resource "google_cloudfunctions_function" "this" {
  name                         = "function-249-green"
  runtime                      = "python37"
  available_memory_mb          = 128
  trigger_http                 = true
  entry_point                  = "hello_world"
  source_archive_bucket        = google_storage_bucket.this.name
  source_archive_object        = google_storage_bucket_object.this.name
  https_trigger_security_level = "SECURE_ALWAYS"

  labels = {
    custodiarule     = "ecc-gcp-249-cloud_function_http_trigger_not_secured"
    compliancestatus = "green"
  }
}
