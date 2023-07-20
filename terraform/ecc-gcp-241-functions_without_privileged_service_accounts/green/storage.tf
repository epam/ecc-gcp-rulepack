resource "google_storage_bucket" "this" {
  name     = "bucket-241-green"
  location = var.region

  labels = {
    custodiarule     = "ecc-gcp-241-functions_without_privileged_service_accounts"
    compliancestatus = "green"
  }
}

resource "google_storage_bucket_object" "this" {
  name   = "index.zip"
  bucket = google_storage_bucket.this.name
  source = "./main.py.zip"
}
