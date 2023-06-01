resource "google_storage_bucket" "this" {
  name     = "bucket-248-red"
  location = var.region

  labels = {
    custodiarule     = "ecc-gcp-248-cloud_functions_configured_with_event_trigger"
    compliancestatus = "red"
  }
}

resource "google_storage_bucket_object" "this" {
  name   = "index.zip"
  bucket = google_storage_bucket.this.name
  source = "./main.py.zip"
}
