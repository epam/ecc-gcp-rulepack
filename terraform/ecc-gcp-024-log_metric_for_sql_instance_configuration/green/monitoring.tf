resource "google_monitoring_alert_policy" "this" {
  display_name = var.alertname
  combiner     = "OR"
  conditions {
    display_name = var.conname
    condition_threshold {
      filter     = "metric.type=\"logging.googleapis.com/user/${google_logging_metric.this.id}\" resource.type=\"gce_instance\""
      duration   = "0s"
      comparison = "COMPARISON_GT"
      trigger {
        count = "1"
      }
      aggregations {
        alignment_period   = "600s"
        per_series_aligner = "ALIGN_DELTA"
      }
    }
  }
}