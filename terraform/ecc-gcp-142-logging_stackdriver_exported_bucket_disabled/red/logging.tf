resource "google_logging_project_sink" "this" {
  name                   = var.log_sink
  description            = "log sink for instance"
  destination            = "storage.googleapis.com/${google_storage_bucket.this.name}"
  filter                 = "resource.type = gce_instance AND severity >= WARNING"
  unique_writer_identity = true
}