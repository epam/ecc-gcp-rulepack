resource "google_project_iam_binding" "this" {
  role    = "roles/storage.objectCreator"
  project = var.project

  members = [
    google_logging_project_sink.this.writer_identity,
  ]
}
