resource "google_storage_bucket" "this" {
  name     = "customer-managed-encryption-key-bucket-${data.google_project.this.number}-141-green"
  location = var.region

  encryption {
    default_kms_key_name = google_kms_crypto_key.this.id
  }

  labels = {
    custodiarule     = "ecc-gcp-141-storage_bucket_encrypted_using_default_kms"
    compliancestatus = "green"
  }
}
