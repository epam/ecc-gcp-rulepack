resource "google_logging_project_sink" "this" {
  name        = var.sinkname
  destination = "pubsub.googleapis.com/projects/${var.project}/topics/topic-015"
  filter      = "resource.type = gce_instance AND severity >= WARNING"
}
