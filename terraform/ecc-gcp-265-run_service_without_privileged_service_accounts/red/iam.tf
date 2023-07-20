resource "google_cloud_run_service_iam_binding" "this" {
  location = var.region
  project  = var.project
  service  = google_cloud_run_service.this.name
  role     = "roles/editor"
  members = [
    "serviceAccount:${google_service_account.this.account_id}@${var.project}.iam.gserviceaccount.com",
  ]
}

resource "google_service_account" "this" {
  account_id   = "service-account-id-265-red"
  display_name = "Service-Account-265-red"
}

resource "google_project_iam_member" "this" {
  project = var.project
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.this.account_id}@${var.project}.iam.gserviceaccount.com"
}