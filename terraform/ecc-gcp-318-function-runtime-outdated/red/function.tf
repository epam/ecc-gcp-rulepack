resource "google_cloudfunctions_function" "this" {
  name                  = "function-318-red"
  runtime               = "nodejs8"
  available_memory_mb   = 128
  trigger_http          = true
  entry_point           = "helloWorld"
  source_archive_bucket = google_storage_bucket.this.name
  source_archive_object = google_storage_bucket_object.this.name

  labels = {
    custodiarule     = "ecc-gcp-318-function-runtime-outdated"
    compliancestatus = "red"
  }
}
