resource "google_storage_bucket" "this" {
  name     = var.name
  location = var.region

  labels = {
    custodiarule     = "ecc-gcp-141-storage_bucket_encrypted_using_default_kms"
    compliancestatus = "red"
  }
}
