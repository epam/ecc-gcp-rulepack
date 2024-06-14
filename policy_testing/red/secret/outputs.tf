output "secret" {
  value = {
    secret = google_secret_manager_secret.this.name
  }
}