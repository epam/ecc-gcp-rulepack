resource "google_compute_global_forwarding_rule" "this" {
  name       = "global-rule-091-green"
  target     = google_compute_target_https_proxy.this.id
  port_range = "443"

  labels = {
    custodianrule    = "ecc-gcp-091-encrypted_connection_between_cdn_and_server"
    compliancestatus = "green"
  }
}

resource "google_compute_managed_ssl_certificate" "this" {
  name = "test-cert-091-green"

  managed {
    domains = ["sslcert.tf-test.club."]
  }
}

resource "google_compute_target_https_proxy" "this" {
  name             = "test-proxy"
  url_map          = google_compute_url_map.this.id
  ssl_certificates = [google_compute_managed_ssl_certificate.this.id]
}

resource "google_compute_url_map" "this" {
  name            = "url-map-091-green"
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
  name          = "backend-service-091-green"
  health_checks = [google_compute_health_check.this.id]
  protocol      = "HTTPS"
  enable_cdn    = true

  cdn_policy {
    signed_url_cache_max_age_sec = 7200
  }
}

resource "google_compute_health_check" "this" {
  name               = "health-check-091-green"
  check_interval_sec = 1
  timeout_sec        = 1

  ssl_health_check {
    port = "443"
  }
}
