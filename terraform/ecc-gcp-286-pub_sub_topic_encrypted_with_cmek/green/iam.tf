data "google_project" "this" {
}

resource "google_project_iam_member" "this" {
  project = data.google_project.this.project_id
  role    = var.role
  member  = "serviceAccount:service-${data.google_project.this.number}@gcp-sa-pubsub.iam.gserviceaccount.com"
}
