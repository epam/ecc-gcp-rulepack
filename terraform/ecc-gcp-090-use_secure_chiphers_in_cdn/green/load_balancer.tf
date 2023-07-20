resource "google_compute_global_forwarding_rule" "this" {
  name       = "global-rule-090-green"
  target     = google_compute_target_https_proxy.this.id
  port_range = "443"

  labels = {
    custodianrule    = "ecc-gcp-090-use_secure_chiphers_in_cdn"
    compliancestatus = "green"
  }
}

resource "google_compute_managed_ssl_certificate" "this" {
  name = "test-cert-090-green"

  managed {
    domains = ["sslcert.tf-test.club."]
  }
}

resource "google_compute_ssl_policy" "this" {
  name            = "ssl-policy-090-green"
  profile         = "MODERN"
  min_tls_version = "TLS_1_1"
}

resource "google_compute_target_https_proxy" "this" {
  name             = "test-proxy-090-green"
  url_map          = google_compute_url_map.this.id
  ssl_certificates = [google_compute_managed_ssl_certificate.this.id]
  ssl_policy       = google_compute_ssl_policy.this.id
}

resource "google_compute_url_map" "this" {
  name            = "url-map-090-green"
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
  name       = "balancer-090-green"
  protocol   = "HTTPS"
  enable_cdn = true
  cdn_policy {
    signed_url_cache_max_age_sec = 7200
  }
  health_checks = [google_compute_health_check.this.id]
}

resource "google_compute_health_check" "this" {
  name = "ssl-health-check-090-green"

  timeout_sec        = 1
  check_interval_sec = 1

  ssl_health_check {
    port = "443"
  }
}
