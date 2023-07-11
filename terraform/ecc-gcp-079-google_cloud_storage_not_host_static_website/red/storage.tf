resource "google_storage_bucket" "this" {
  name     = var.bucket_name
  location = var.region

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }

  labels = {
    custodianrule    = "ecc-gcp-079-google_cloud_storage_not_host_static_website"
    compliancestatus = "red"
  }
}
