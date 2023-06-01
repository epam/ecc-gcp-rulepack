resource "random_id" "this" {
  byte_length = 4
}

resource "google_kms_key_ring" "this" {
  name     = "keyring-${random_id.this.hex}-291-green"
  location = "us-east1"
}

resource "google_kms_crypto_key" "this" {
  name            = var.key-name
  key_ring        = google_kms_key_ring.this.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = false
  }
}

data "google_project" "project" {
}

resource "google_project_iam_member" "this" {
  role    = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member  = "serviceAccount:service-${data.google_project.project.number}@gcp-sa-secretmanager.iam.gserviceaccount.com"
  project = var.project
}

resource "google_secret_manager_secret" "this" {
  secret_id = var.secret

  labels = {
    label = var.s-label
  }

  replication {
    user_managed {
      replicas {
        location = "us-east1"
        customer_managed_encryption {
          kms_key_name = google_kms_crypto_key.this.id
        }
      }
    }
  }

  depends_on = [
    google_project_iam_member.this
  ]

}
