resource "google_kms_key_ring" "this" {
  name     = var.ringname
  location = var.region
}

resource "google_kms_crypto_key" "this" {
  name            = var.keyname
  key_ring        = google_kms_key_ring.this.id
  rotation_period = "100000s"
}
