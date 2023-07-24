resource "google_project_iam_binding" "this" {
  project = var.project
  role    = "roles/storage.objectCreator"

  members = [
    google_logging_project_sink.this.writer_identity,
  ]
}
