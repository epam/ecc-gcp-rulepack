resource "google_storage_bucket" "this" {
  name     = "bucket-249-green"
  location = var.region

  labels = {
    custodiarule     = "ecc-gcp-249-cloud_function_http_trigger_not_secured"
    compliancestatus = "green"
  }
}

resource "google_storage_bucket_object" "this" {
  name   = "index.zip"
  bucket = google_storage_bucket.this.name
  source = "./main.py.zip"
}
