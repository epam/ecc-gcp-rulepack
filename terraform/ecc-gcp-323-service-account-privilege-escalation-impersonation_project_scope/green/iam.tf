resource "google_service_account" "this" {
  account_id   = "service-account-id-323-green"
  display_name = "service-account-323-green"
}

resource "google_project_iam_member" "this" {
  project = var.project
  role    = "roles/viewer"
  member  = "serviceAccount:${google_service_account.this.account_id}@${var.project}.iam.gserviceaccount.com"
}