resource "google_storage_bucket" "this" {
  name     = "bucket-246-green"
  location = var.region

  labels = {
    custodiarule     = "ecc-gcp-246-functions_configured_with_vpc_connector"
    compliancestatus = "green"
  }
}

resource "google_storage_bucket_object" "this" {
  name   = "index.zip"
  bucket = google_storage_bucket.this.name
  source = "./main.py.zip"
}
