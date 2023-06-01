resource "google_secret_manager_secret" "this" {
  secret_id = var.id

  labels = {
    label = var.label
  }

  replication {
    automatic = true
  }
}
