# To prevent resource name collisions, key ring and key resources CANNOT be deleted. 
# Key versions also cannot be deleted, but the key removal will happen (it takes 24 hours)

resource "random_id" "this" {
  byte_length = 4
}

resource "google_kms_crypto_key" "this" {
  name            = "gcs-key-${random_id.this.hex}-141-green"
  key_ring        = google_kms_key_ring.this.id
  rotation_period = "86401s"
}

resource "google_kms_key_ring" "this" {
  name     = "gcs-key-${random_id.this.hex}-141-green"
  location = var.region
}

# grant KMS Encrypter Decryptor permissions to the Google Storage Service
resource "google_project_iam_member" "this" {
  role    = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  project = var.project
  member  = "serviceAccount:service-${data.google_project.this.number}@gs-project-accounts.iam.gserviceaccount.com"
}

data "google_project" "this" {}