resource "google_service_account" "this" {
  account_id   = "service-account-id-265-green"
  display_name = "Service-Account-265-green"
}

resource "google_cloud_run_service_iam_binding" "this" {
  location = var.region
  project  = var.project
  service  = google_cloud_run_service.this.name
  role     = "roles/run.sourceViewer"
  members = [
    "serviceAccount:${google_service_account.this.account_id}@${var.project}.iam.gserviceaccount.com",
  ]
}