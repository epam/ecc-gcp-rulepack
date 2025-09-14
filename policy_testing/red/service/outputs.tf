output "service" {
  value = {
    service             = "projects/${data.google_project.this.number}/services/cloudasset.googleapis.com"
    service-account-key = google_service_account_key.this.name
  }
}