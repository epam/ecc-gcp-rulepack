resource "google_secret_manager_secret" "this" {
  secret_id = var.secret

  labels = {
    label = var.s-label
  }

  replication {
    user_managed {
      replicas {
        location = "us-central1"
      }
      replicas {
        location = "us-east1"
      }
    }
  }
}