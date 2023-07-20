resource "google_service_account" "this" {
  account_id   = "service-account-id-262-red"
  display_name = "service-account-262-red"
}

resource "google_project_iam_member" "this" {
  project = var.project
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.this.account_id}@${var.project}.iam.gserviceaccount.com"
}