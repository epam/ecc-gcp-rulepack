resource "google_logging_metric" "this" {
  name   = var.metricname
  filter = "resource.type=gce_network AND jsonPayload.event_subtype=\"compute.networks.insert\" OR jsonPayload.event_subtype=\"compute.networks.patch\" OR jsonPayload.event_subtype=\"compute.networks.delete\" OR jsonPayload.event_subtype=\"compute.networks.removePeering\" OR jsonPayload.event_subtype=\"compute.networks.addPeering\""
  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
    unit        = "1"
  }
}