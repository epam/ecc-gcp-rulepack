resource "google_storage_bucket" "this" {
  name     = "bucket-243-green"
  location = var.region

  labels = {
    custodiarule     = "ecc-gcp-243-not_allow_all_traffic_ingress_for_functions"
    compliancestatus = "green"
  }
}

resource "google_storage_bucket_object" "this" {
  name   = "index.zip"
  bucket = google_storage_bucket.this.name
  source = "./main.py.zip"
}
