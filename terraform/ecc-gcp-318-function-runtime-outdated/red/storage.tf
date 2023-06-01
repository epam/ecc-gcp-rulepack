resource "google_storage_bucket" "this" {
  name     = "bucket-318-red"
  location = var.region

  labels = {
    custodiarule     = "ecc-gcp-318-function-runtime-outdated"
    compliancestatus = "red"
  }
}

resource "google_storage_bucket_object" "this" {
  name   = "index.zip"
  bucket = google_storage_bucket.this.name
  source = "./index.js.zip"
}
