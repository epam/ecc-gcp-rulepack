resource "random_id" "this" {
  byte_length = 4
}

data "google_project" "this" {}

resource "google_kms_key_ring" "this" {
  name     = "${var.key_ring}-${random_id.this.hex}"
  location = var.region
}

resource "google_kms_crypto_key" "this" {
  name     = "${var.crypto_key}-${random_id.this.hex}"
  key_ring = google_kms_key_ring.this.id
}

resource "google_kms_crypto_key_iam_binding" "this" {
  crypto_key_id = google_kms_crypto_key.this.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  members = [
    "serviceAccount:service-${data.google_project.this.number}@container-engine-robot.iam.gserviceaccount.com",
  ]
}