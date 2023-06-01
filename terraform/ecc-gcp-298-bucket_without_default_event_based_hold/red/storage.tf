resource "google_storage_bucket" "this" {
  name                     = "bucket_default_event_based_hold_298_red"
  location                 = var.region
  default_event_based_hold = false

  labels = {
    custodiarule     = "ecc-gcp-298-bucket_without_default_event_based_hold"
    compliancestatus = "red"
  }
}
