resource "google_storage_bucket" "this" {
  name     = "bucket-247-red"
  location = var.region

  labels = {
    custodiarule     = "ecc-gcp-247-cloud_functions_in_active_mode"
    compliancestatus = "red"
  }
}

resource "google_storage_bucket_object" "this" {
  name   = "index.zip"
  bucket = google_storage_bucket.this.name
  source = "./main.py.zip"
}
