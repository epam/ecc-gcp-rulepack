resource "google_service_account" "this" {
  account_id   = "service-account-id-225-red"
  display_name = "service-account-225-red"
}

resource "google_project_iam_member" "this" {
  project = var.project
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.this.account_id}@${var.project}.iam.gserviceaccount.com"
}