resource "google_cloudfunctions_function" "this" {
  name                  = module.naming.resource_prefix.function
  runtime               = "nodejs16"
  available_memory_mb   = 128
  trigger_http          = true
  entry_point           = "helloWorld"
  source_archive_bucket = google_storage_bucket.this.name
  source_archive_object = google_storage_bucket_object.this.name
}

resource "google_cloudfunctions_function_iam_binding" "this" {
  cloud_function = google_cloudfunctions_function.this.name
  role           = "roles/viewer"

  members = ["allAuthenticatedUsers"]
}