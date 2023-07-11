# To prevent resource name collisions, key ring and key resources CANNOT be deleted. 
# Key versions also cannot be deleted, but the key removal will happen (it takes 24 hours)

resource "random_id" "this" {
  byte_length = 4
}

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
  name            = "keyname-${random_id.this.hex}-${var.prefix}"
  key_ring        = data.google_kms_key_ring.this.id != null ? data.google_kms_key_ring.this.id : google_kms_key_ring.this[0].id
  rotation_period = "86401s"

  labels = {
    custodiarule     = "ecc-gcp-141-storage_bucket_encrypted_using_default_kms"
    compliancestatus = "green"
  }
}

# grant KMS Encrypter Decryptor permissions to the Google Storage Service
resource "google_kms_crypto_key_iam_binding" "this" {
  crypto_key_id = google_kms_crypto_key.this.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  members = [
    "serviceAccount:service-${data.google_project.this.number}@gs-project-accounts.iam.gserviceaccount.com",
  ]
}

data "google_project" "this" {}
