resource "google_storage_bucket" "this" {
  name     = "bucket-247-green"
  location = var.region

  labels = {
    custodiarule     = "ecc-gcp-247-cloud_functions_in_active_mode"
    compliancestatus = "green"
  }
}

resource "google_storage_bucket_object" "this" {
  name   = "index.zip"
  bucket = google_storage_bucket.this.name
  source = "./main.py.zip"
}
