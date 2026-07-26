resource "google_storage_bucket_access_control" "this" {
  bucket = google_storage_bucket.this.name
  role   = "READER"
  entity = "allUsers"
}

resource "random_id" "this" {
  byte_length = 4
}

resource "google_storage_bucket" "this" {
  name     = "${module.naming.resource_prefix.bucket}-${random_id.this.hex}"
  location = var.region

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }

}