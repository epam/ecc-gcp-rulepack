resource "google_storage_bucket" "this" {
  name     = "customer-managed-encryption-key-bucket-${data.google_project.this.number}-141-green"
  location = var.region

  encryption {
    default_kms_key_name = google_kms_crypto_key.this.id
  }
}