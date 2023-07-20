resource "google_service_account" "this" {
  account_id   = var.serviceac
  display_name = var.dname
}

resource "google_project_iam_member" "this" {
  project = var.project
  role    = var.role
  member  = "serviceAccount:${google_service_account.this.email}"
}