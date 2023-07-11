resource "random_id" "this" {
  byte_length = 4
}

data "google_project" "this" {}

data "google_kms_key_ring" "this" {
  name     = "keyring-${var.prefix}"
  location = var.region
}

resource "google_kms_key_ring" "this" {
  count    = data.google_kms_key_ring.this.id != null ? 0 : 1
  name     = "keyring-${var.prefix}"
  location = var.region
}

resource "google_kms_crypto_key" "this" {
  name     = "keyname-${random_id.this.hex}-${var.prefix}"
  key_ring = data.google_kms_key_ring.this.id != null ? data.google_kms_key_ring.this.id : google_kms_key_ring.this[0].id

  labels = {
    custodiarule     = "ecc-gcp-132-cluster_application-layer_secrets_not_encrypted"
    compliancestatus = "green"
  }
}


resource "google_kms_crypto_key_iam_binding" "this" {
  crypto_key_id = google_kms_crypto_key.this.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  members = [
    "serviceAccount:service-${data.google_project.this.number}@container-engine-robot.iam.gserviceaccount.com",
  ]
}
