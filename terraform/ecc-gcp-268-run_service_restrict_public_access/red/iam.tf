resource "google_cloud_run_service_iam_binding" "binding" {
  location = var.region
  project  = var.project
  service  = google_cloud_run_service.this.name
  role     = "roles/run.viewer"
  members = [
    "allAuthenticatedUsers",
  ]
}