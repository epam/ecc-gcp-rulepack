resource "random_id" "this" {
  byte_length = 4
}

resource "google_kms_crypto_key" "this" {
  name     = "crypto-key-${random_id.this.hex}-286-green"
  key_ring = google_kms_key_ring.this.id
}

resource "google_kms_key_ring" "this" {
  name     = "key-ring-${random_id.this.hex}-286-green"
  location = "global"
}
