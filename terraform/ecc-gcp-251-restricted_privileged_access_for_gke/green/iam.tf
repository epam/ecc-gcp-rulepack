resource "google_service_account" "this" {
  account_id   = "service-account-id-251-green"
  display_name = "Service-Account-251-green"
}

resource "google_project_iam_member" "this" {
  project = var.project
  role    = "roles/container.viewer"
  member  = "serviceAccount:${google_service_account.this.account_id}@${var.project}.iam.gserviceaccount.com"
}
