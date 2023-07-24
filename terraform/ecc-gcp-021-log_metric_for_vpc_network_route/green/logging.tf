resource "google_logging_metric" "this" {
  name   = var.metricname
  filter = "resource.type=\"gce_route\" AND jsonPayload.event_subtype=\"compute.routes.delete\" OR jsonPayload.event_subtype=\"compute.routes.insert\""
  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
    unit        = "1"
  }
}