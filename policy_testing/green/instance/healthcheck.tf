resource "google_compute_health_check" "this" {
  name                = module.naming.resource_prefix.health_check
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 10

  http_health_check {
    request_path = "/health"
    port         = "8080"
  }
}
