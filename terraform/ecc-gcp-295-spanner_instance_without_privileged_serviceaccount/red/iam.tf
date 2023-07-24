resource "google_service_account" "this" {
  account_id   = "service-account-id-295-red"
  display_name = "service-account-295-red"
}

resource "google_project_iam_member" "this" {
  project = var.project
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.this.account_id}@${var.project}.iam.gserviceaccount.com"
}

resource "google_spanner_instance_iam_binding" "this" {
  instance = google_spanner_instance.this.name
  role     = "roles/editor"

  members = [
    google_project_iam_member.this.member,
  ]
}