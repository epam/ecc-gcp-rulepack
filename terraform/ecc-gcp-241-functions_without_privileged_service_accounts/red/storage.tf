resource "google_storage_bucket" "this" {
  name     = "bucket-241-red"
  location = var.region

  labels = {
    custodiarule     = "ecc-gcp-241-functions_without_privileged_service_accounts"
    compliancestatus = "red"
  }
}

resource "google_storage_bucket_object" "this" {
  name   = "index.zip"
  bucket = google_storage_bucket.this.name
  source = "./main.py.zip"
}
