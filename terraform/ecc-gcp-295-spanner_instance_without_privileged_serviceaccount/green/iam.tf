resource "google_service_account" "this" {
  account_id   = "service-account-id-295-green"
  display_name = "service-account-295-green"
}

resource "google_project_iam_member" "this" {
  project = var.project
  role    = "roles/spanner.databaseReader"
  member  = "serviceAccount:${google_service_account.this.account_id}@${var.project}.iam.gserviceaccount.com"
}

resource "google_spanner_instance_iam_binding" "this" {
  instance = google_spanner_instance.this.name
  role     = "roles/spanner.databaseReader"

  members = [
    google_project_iam_member.this.member,
  ]
}