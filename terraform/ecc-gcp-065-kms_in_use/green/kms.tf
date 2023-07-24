data "google_kms_key_ring" "this" {
  name     = "keyring-${var.prefix}"
  location = var.region
}

resource "google_kms_key_ring" "this" {
  count    = data.google_kms_key_ring.this.id != null ? 0 : 1
  name     = "keyring-${var.prefix}"
  location = var.region
}
