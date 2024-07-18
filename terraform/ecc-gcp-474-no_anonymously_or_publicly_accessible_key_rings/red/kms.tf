resource "random_id" "this" {
  byte_length = 4
}

resource "google_kms_key_ring" "this" {
  name     = "keyring-${random_id.this.hex}-${var.prefix}"
  location = var.region
}

resource "google_kms_crypto_key" "this" {
  name            = "keyname-${random_id.this.hex}-${var.prefix}"
  key_ring        = google_kms_key_ring.this.id
  rotation_period = "7776001s"

  labels = {
    custodiarule     = "ecc-gcp-474-no_anonymously_or_publicly_accessible_key_rings"
    compliancestatus = "red"
  }
}

resource "google_kms_key_ring_iam_binding" "this" {
  key_ring_id = google_kms_key_ring.this.id
  role        = "roles/cloudkms.cryptoKeyEncrypter"

  members = [
    "allUsers",
  ]
}