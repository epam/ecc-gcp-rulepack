resource "google_cloudfunctions_function" "this" {
  name                  = "function-243-red"
  runtime               = "python37"
  available_memory_mb   = 128
  trigger_http          = true
  entry_point           = "hello_world"
  source_archive_bucket = google_storage_bucket.this.name
  source_archive_object = google_storage_bucket_object.this.name
  ingress_settings      = "ALLOW_ALL"

  labels = {
    custodiarule     = "ecc-gcp-243-not_allow_all_traffic_ingress_for_functions"
    compliancestatus = "red"
  }
}
