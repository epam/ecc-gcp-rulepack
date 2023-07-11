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
      }
    }
  }
}
