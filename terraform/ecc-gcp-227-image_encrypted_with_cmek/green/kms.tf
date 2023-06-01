resource "random_id" "this" {
  byte_length = 4
}

resource "google_kms_key_ring" "this" {
  name     = "keyring-key-${random_id.this.hex}-227-green"
  location = var.region
}

resource "google_kms_crypto_key" "this" {
  name            = "crypto-key-${random_id.this.hex}-227-green"
  key_ring        = google_kms_key_ring.this.id
  rotation_period = "7776001s"
}

data "google_project" "this" {}

resource "google_kms_crypto_key_iam_binding" "this" {
  crypto_key_id = google_kms_crypto_key.this.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members = [
    "serviceAccount:service-${data.google_project.this.number}@compute-system.iam.gserviceaccount.com",
  ]
}