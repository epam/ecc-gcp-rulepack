resource "google_storage_bucket" "this" {
  name     = "bucket-244-green"
  location = var.region

  labels = {
    custodiarule     = "ecc-gcp-244-unauthenticated_invocation_for_cloud_functions"
    compliancestatus = "green"
  }
}

resource "google_storage_bucket_object" "this" {
  name   = "index.zip"
  bucket = google_storage_bucket.this.name
  source = "./main.py.zip"
}
