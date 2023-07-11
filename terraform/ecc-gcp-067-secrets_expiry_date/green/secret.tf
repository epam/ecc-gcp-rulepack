resource "google_secret_manager_secret" "this" {
  secret_id = var.id

  labels = {
    label = var.label
  }

  replication {
    automatic = true
  }

  expire_time = "2030-08-12T10:59:25Z"
}
