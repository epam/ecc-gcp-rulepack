resource "google_logging_metric" "this" {
  name   = var.metricname
  filter = "resource.type=\"gce_firewall_rule\" AND jsonPayload.event_subtype=\"compute.firewalls.patch\" OR jsonPayload.event_subtype=\"compute.firewalls.insert\""
  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
    unit        = "1"
  }
}