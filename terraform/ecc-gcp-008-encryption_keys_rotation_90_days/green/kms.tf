resource "random_id" "this" {
  byte_length = 4
}

resource "google_kms_key_ring" "this" {
  name     = "keyring-key-${random_id.this.hex}-008-green"
  location = "global"
}

resource "google_kms_crypto_key" "this" {
  name            = "crypto-key-${random_id.this.hex}-008-green"
  key_ring        = google_kms_key_ring.this.id
  rotation_period = "7776001s"
}
