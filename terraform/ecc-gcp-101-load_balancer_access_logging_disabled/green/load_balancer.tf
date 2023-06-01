resource "google_compute_global_forwarding_rule" "this" {
  name       = "global-rule-101-green"
  target     = google_compute_target_https_proxy.this.id
  port_range = "443"

  labels = {
    custodiarule     = "ecc-gcp-101-load_balancer_access_logging_disabled"
    compliancestatus = "green"
  }
}

resource "google_compute_managed_ssl_certificate" "this" {
  name = "test-cert-101-green"

  managed {
    domains = ["sslcert.tf-test.club."]
  }
}

resource "google_compute_target_https_proxy" "this" {
  name             = "test-proxy-101-green"
  url_map          = google_compute_url_map.this.id
  ssl_certificates = [google_compute_managed_ssl_certificate.this.id]
}

resource "google_compute_url_map" "this" {
  name            = "url-map-101-green"
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
  name          = "backend-service-101-green"
  health_checks = [google_compute_http_health_check.this.id]

  log_config {
    enable = true
  }

}

resource "google_compute_http_health_check" "this" {
  name               = "health-check-101-green"
  request_path       = "/"
  check_interval_sec = 1
  timeout_sec        = 1
}
