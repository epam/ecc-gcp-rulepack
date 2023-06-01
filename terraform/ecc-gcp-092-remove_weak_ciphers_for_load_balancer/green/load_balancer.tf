resource "google_compute_global_forwarding_rule" "this" {
  name       = "global-rule-092-green"
  target     = google_compute_target_ssl_proxy.this.id
  port_range = "443"

  labels = {
    custodianrule    = "ecc-gcp-092-remove_weak_ciphers_for_load_balancer"
    compliancestatus = "green"
  }
}

resource "google_compute_ssl_policy" "this" {
  name            = "ssl-policy-092-092-green"
  profile         = "MODERN"
  min_tls_version = "TLS_1_1"
}

resource "google_compute_managed_ssl_certificate" "this" {
  name = "cert092-092-green"

  managed {
    domains = ["sslcert.tf-test.club."]
  }
}

resource "google_compute_target_ssl_proxy" "this" {
  name             = "test-proxy-092-green"
  backend_service  = google_compute_backend_service.this.id
  ssl_certificates = [google_compute_managed_ssl_certificate.this.id]
  ssl_policy       = google_compute_ssl_policy.this.id
}

resource "google_compute_backend_service" "this" {
  name          = "balancer-092-green"
  protocol      = "SSL"
  health_checks = [google_compute_health_check.this.id]
}

resource "google_compute_health_check" "this" {
  name = "ssl-health-check-092-green"

  timeout_sec        = 1
  check_interval_sec = 1

  ssl_health_check {
    port = "443"
  }
}
