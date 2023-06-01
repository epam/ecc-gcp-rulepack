data "google_project" "this" {}

resource "random_id" "this" {
  byte_length = 4
}

resource "google_kms_key_ring" "this" {
  name     = "key-ring-${random_id.this.hex}-317-green"
  location = var.region
}

resource "google_kms_crypto_key" "this" {
  name     = "crypto-key-${random_id.this.hex}-317-green"
  key_ring = google_kms_key_ring.this.id
}

resource "google_kms_crypto_key_iam_member" "this" {
  crypto_key_id = google_kms_crypto_key.this.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:service-${data.google_project.this.number}@gcp-sa-bigtable.iam.gserviceaccount.com"

  depends_on = [
    google_project_service_identity.this
  ]
}


resource "google_project_service_identity" "this" {
  provider = google-beta
  service  = "bigtableadmin.googleapis.com"
}
