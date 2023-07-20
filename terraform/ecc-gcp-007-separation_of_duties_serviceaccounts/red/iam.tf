resource "google_service_account" "this" {
  account_id   = var.serviceac
  display_name = var.dname
}

resource "google_project_iam_member" "role1" {
  project = var.project
  role    = var.role1
  member  = "serviceAccount:${google_service_account.this.email}"
}

resource "google_project_iam_member" "role2" {
  project = var.project
  role    = var.role2
  member  = "serviceAccount:${google_service_account.this.email}"
}