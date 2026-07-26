resource "google_storage_bucket" "this" {
  name     = "${module.naming.resource_prefix.bucket}-${random_id.this.hex}"
  location = var.region
}

resource "google_storage_bucket_object" "this" {
  name   = "index.zip"
  bucket = google_storage_bucket.this.name
  source = "./main.py.zip"
}

resource "random_id" "this" {
  byte_length = 4
}
