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
  rotation_period = "7776001s"

  labels = {
    custodiarule     = "ecc-gcp-291-secret_manager_secret_encrypted_with_cmek"
    compliancestatus = "green"
  }
}

data "google_project" "this" {}

resource "google_kms_crypto_key_iam_binding" "this" {
  crypto_key_id = google_kms_crypto_key.this.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members = [
    "serviceAccount:service-${data.google_project.this.number}@gcp-sa-secretmanager.iam.gserviceaccount.com",
  ]
}

resource "google_secret_manager_secret" "this" {
  secret_id = "secret-${var.prefix}"

  labels = {
    custodiarule     = "ecc-gcp-291-secret_manager_secret_encrypted_with_cmek"
    compliancestatus = "green"
  }

  replication {
    user_managed {
      replicas {
        location = var.region
        customer_managed_encryption {
          kms_key_name = google_kms_crypto_key.this.id
        }
      }
    }
  }

  depends_on = [
    google_kms_crypto_key_iam_binding.this
  ]

}
