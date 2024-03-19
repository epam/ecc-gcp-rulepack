resource "google_storage_bucket" "this" {
  name          = "${module.naming.resource_prefix.bucket}-dataflow"
  location      = var.region
  force_destroy = true
}

resource "google_storage_bucket_object" "this" {
  name    = "text.txt"
  bucket  = google_storage_bucket.this.name
  content = "Hello world!"
}
