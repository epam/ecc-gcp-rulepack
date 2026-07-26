output "function" {
  value = {
    function                                                  = google_cloudfunctions_function.this.id
    ecc-gcp-248-cloud_functions_configured_with_event_trigger = google_cloudfunctions_function.this2.id
  }
}