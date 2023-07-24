resource "google_logging_project_sink" "this" {
  name                   = var.sinkname
  destination            = var.dest
  filter                 = "resource.type = gce_instance AND severity >= WARNING"
  unique_writer_identity = true

  depends_on = [
    google_storage_bucket.this
  ]
}

resource "google_project_iam_binding" "this" {
  role    = "roles/storage.objectCreator"
  project = var.project
  members = [
    google_logging_project_sink.this.writer_identity,
  ]
}
