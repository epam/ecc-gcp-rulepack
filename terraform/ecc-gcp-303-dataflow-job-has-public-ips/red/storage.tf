resource "google_storage_bucket" "this" {
  name          = "bucket-303-red"
  location      = var.region
  force_destroy = true

  labels = {
    custodiarule     = "ecc-gcp-303-dataflow-job-has-public-ips"
    compliancestatus = "red"
  }
}

resource "google_storage_bucket_object" "this" {
  name   = "text.txt"
  bucket = google_storage_bucket.this.name
  source = "./text.txt"
}
