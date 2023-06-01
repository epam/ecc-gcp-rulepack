resource "google_storage_bucket" "this" {
  name          = "test-bucket-303-green"
  location      = var.region
  force_destroy = true

  labels = {
    custodiarule     = "ecc-gcp-303-dataflow-job-has-public-ips"
    compliancestatus = "green"
  }
}

resource "google_storage_bucket_object" "this" {
  name   = "text.txt"
  bucket = google_storage_bucket.this.name
  source = "./text.txt"
}
