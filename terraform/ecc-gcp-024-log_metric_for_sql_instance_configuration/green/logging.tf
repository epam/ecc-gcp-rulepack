resource "google_logging_metric" "this" {
  name   = var.metricname
  filter = "protoPayload.methodName=\"cloudsql.instances.update\""
  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
    unit        = "1"
  }
}