resource "google_storage_bucket" "this" {
  name     = "bucket-318-green"
  location = var.region

  labels = {
    custodiarule     = "ecc-gcp-318-function-runtime-outdated"
    compliancestatus = "green"
  }
}

resource "google_storage_bucket_object" "this" {
  name   = "index.zip"
  bucket = google_storage_bucket.this.name
  source = "./main.py.zip"
}
