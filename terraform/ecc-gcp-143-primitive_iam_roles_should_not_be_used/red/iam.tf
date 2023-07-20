resource "google_service_account" "this" {
  account_id   = "service-account-143"
  display_name = "Service Account"
}

resource "google_project_iam_member" "this" {
  project = var.project
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.this.account_id}@${var.project}.iam.gserviceaccount.com"
}
