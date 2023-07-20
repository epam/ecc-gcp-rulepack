resource "google_project_iam_member" "this" {
  project = var.project
  role    = "roles/firebase.admin"
  member  = var.member
}