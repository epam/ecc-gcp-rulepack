resource "google_compute_global_forwarding_rule" "this" {
  name       = "global-rule-070-green"
  target     = google_compute_target_https_proxy.this.id
  port_range = "443"

  labels = {
    custodianrule    = "ecc-gcp-070-armor_enabled"
    compliancestatus = "green"
  }
}

resource "google_compute_managed_ssl_certificate" "this" {
  name = "test-cert-070-green"

  managed {
    domains = ["sslcert.tf-test.club."]
  }
}

resource "google_compute_target_https_proxy" "this" {
  name             = "test-proxy-070-green"
  url_map          = google_compute_url_map.this.id
  ssl_certificates = [google_compute_managed_ssl_certificate.this.id]
}

resource "google_compute_url_map" "this" {
  name            = "url-map-070-green"
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
  name            = "backend-service-070-green"
  health_checks   = [google_compute_http_health_check.this.id]
  security_policy = google_compute_security_policy.this.name
}

resource "google_compute_http_health_check" "this" {
  name               = "health-check-070-green"
  request_path       = "/"
  check_interval_sec = 1
  timeout_sec        = 1
}
