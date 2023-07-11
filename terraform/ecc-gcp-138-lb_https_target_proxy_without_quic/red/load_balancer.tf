resource "google_compute_global_forwarding_rule" "this" {
  name       = "global-rule-138-red"
  target     = google_compute_target_https_proxy.this.id
  port_range = "443"

  labels = {
    custodianrule    = "ecc-gcp-138-lb_https_target_proxy_without_quic"
    compliancestatus = "red"
  }
}

resource "google_compute_managed_ssl_certificate" "this" {
  name = "test-cert-138-red"

  managed {
    domains = ["sslcert.tf-test.club."]
  }
}

resource "google_compute_target_https_proxy" "this" {
  name             = "test-proxy-138-red"
  url_map          = google_compute_url_map.this.id
  ssl_certificates = [google_compute_managed_ssl_certificate.this.id]
  quic_override    = var.quic_override
}

resource "google_compute_url_map" "this" {
  name            = "url-map-target-proxy-138-red"
  default_service = google_compute_backend_service.this.id

  host_rule {
    hosts        = ["mysite.com"]
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = google_compute_backend_service.this.id

    path_rule {
      paths   = ["/*"]
      service = google_compute_backend_service.this.id
    }
  }
}

resource "google_compute_backend_service" "this" {
  name        = "backend-138-red"
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 10

  health_checks = [google_compute_http_health_check.this.id]
}

resource "google_compute_http_health_check" "this" {
  name               = "check-backend-138-red"
  request_path       = "/"
  check_interval_sec = 1
  timeout_sec        = 1
}
