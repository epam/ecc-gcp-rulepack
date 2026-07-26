resource "google_secret_manager_secret" "this" {
  secret_id = module.naming.resource_prefix.secret

  expire_time = "2030-08-12T10:59:25Z"

  replication {
    user_managed {
      replicas {
        location = var.region
        customer_managed_encryption {
          kms_key_name = data.terraform_remote_state.common.outputs.crypto_key_id_us_central
        }
      }
    }
  }
}

output "secret" {
  value = google_secret_manager_secret.this.name
}