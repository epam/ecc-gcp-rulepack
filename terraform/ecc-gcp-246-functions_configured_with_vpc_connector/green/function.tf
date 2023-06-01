resource "google_cloudfunctions_function" "this" {
  name                  = "function-246-green"
  runtime               = "python37"
  available_memory_mb   = 128
  trigger_http          = true
  entry_point           = "hello_world"
  source_archive_bucket = google_storage_bucket.this.name
  source_archive_object = google_storage_bucket_object.this.name
  vpc_connector         = google_vpc_access_connector.this.id

  labels = {
    custodiarule     = "ecc-gcp-246-functions_configured_with_vpc_connector"
    compliancestatus = "green"
  }
}
