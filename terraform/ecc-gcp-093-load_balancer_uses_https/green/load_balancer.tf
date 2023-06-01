resource "google_compute_global_forwarding_rule" "this" {
  name       = "global-rule-093-green"
  target     = google_compute_target_https_proxy.this.id
  port_range = "443"

  labels = {
    custodianrule    = "ecc-gcp-093-load_balancer_uses_https"
    compliancestatus = "green"
  }
}

resource "google_compute_managed_ssl_certificate" "this" {
  name = "test-cert-093-green"

  managed {
    domains = ["sslcert.tf-test.club."]
  }
}

resource "google_compute_target_https_proxy" "this" {
  name             = "test-proxy-093-green"
  url_map          = google_compute_url_map.this.id
  ssl_certificates = [google_compute_managed_ssl_certificate.this.id]
  quic_override    = var.quic_override
}

resource "google_compute_url_map" "this" {
  name            = "url-map-target-proxy-093-green"
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
  name          = "test-backend-093-green"
  health_checks = [google_compute_health_check.this.id]
  protocol      = "HTTPS"
}

resource "google_compute_health_check" "this" {
  name = "health-check-093-green"

  http_health_check {
    port = 80
  }
}
