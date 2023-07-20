resource "google_storage_bucket_access_control" "this" {
  bucket = google_storage_bucket.this.name
  role   = "READER"
  entity = "user-test@test.com"
}

resource "google_storage_bucket" "this" {
  name     = var.bucket_name
  location = var.region

  labels = {
    custodiarule     = "ecc-gcp-040-cloud_storage_not_publicly_accessible"
    compliancestatus = "green"
  }

}