resource "google_storage_bucket" "this" {
  name     = "bucket-245-green"
  location = var.region
}

resource "google_storage_bucket_object" "this" {
  name   = "index.zip"
  bucket = google_storage_bucket.this.name
  source = "./main.py.zip"
}