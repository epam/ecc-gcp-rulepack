resource "google_storage_bucket" "this" {
  name          = "bucket_with_rule_162_green"
  location      = var.region
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type = "Delete"
    }
  }
}
