resource "google_service_account" "this" {
  account_id   = "service-account-id-241-red"
  display_name = "service-account-241-red"
}

resource "google_project_iam_member" "this" {
  project = var.project
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.this.account_id}@${var.project}.iam.gserviceaccount.com"
}

resource "google_cloudfunctions_function_iam_binding" "this" {
  cloud_function = google_cloudfunctions_function.this.name
  role           = "roles/editor"

  members = [
    google_project_iam_member.this.member,
  ]
}