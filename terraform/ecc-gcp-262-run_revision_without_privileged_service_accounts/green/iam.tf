resource "google_service_account" "this" {
  account_id   = "service-account-id-262-green"
  display_name = "service-account-262-green"
}

resource "google_project_iam_member" "this" {
  project = var.project
  role    = "roles/run.developer"
  member  = "serviceAccount:${google_service_account.this.account_id}@${var.project}.iam.gserviceaccount.com"
}