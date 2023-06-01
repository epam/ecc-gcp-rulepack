data "google_project" "this" {}
data "google_bigquery_default_service_account" "this" {}

resource "random_id" "this" {
  byte_length = 4
}

resource "google_kms_key_ring" "this" {
  name     = "${var.key_ring}-${random_id.this.hex}-214-green"
  location = var.region
}

resource "google_kms_crypto_key" "this" {
  name     = "${var.crypto_key}-${random_id.this.hex}-214-green"
  key_ring = google_kms_key_ring.this.id
}

resource "google_kms_crypto_key_iam_binding" "this" {
  crypto_key_id = google_kms_crypto_key.this.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  members = [
    "serviceAccount:bq-${data.google_project.this.number}@bigquery-encryption.iam.gserviceaccount.com",
  ]
}

resource "google_kms_crypto_key_iam_member" "this" {
  crypto_key_id = google_kms_crypto_key.this.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:${data.google_bigquery_default_service_account.this.email}"
}
