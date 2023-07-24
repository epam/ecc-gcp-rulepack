resource "google_storage_bucket" "this" {
  name     = "bucket-242-green"
  location = var.region

  labels = {
    custodiarule     = "ecc-gcp-242-cloud_functions_restrict_public_access"
    compliancestatus = "green"
  }
}

resource "google_storage_bucket_object" "this" {
  name   = "index.zip"
  bucket = google_storage_bucket.this.name
  source = "./main.py.zip"
}
