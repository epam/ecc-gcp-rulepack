resource "google_compute_global_forwarding_rule" "this" {
  name       = "global-rule-125-green"
  target     = google_compute_target_https_proxy.this.id
  port_range = "443"

  labels = {
    custodiarule     = "ecc-gcp-125-https_lb_ssl_policy_not_using_restrictiv_profile"
    compliancestatus = "green"
  }
}

resource "google_compute_managed_ssl_certificate" "this" {
  name = "c7n-test-certificate-125-green"

  managed {
    domains = ["sslcert.tf-test.club."]
  }
}

resource "google_compute_ssl_policy" "this" {
  name            = "c7n-ssl-policy-125-green"
  profile         = "MODERN"
  min_tls_version = "TLS_1_2"
}

resource "google_compute_target_https_proxy" "this" {
  name             = "test-proxy-125-green"
  url_map          = google_compute_url_map.this.id
  ssl_certificates = [google_compute_managed_ssl_certificate.this.id]
  ssl_policy       = google_compute_ssl_policy.this.id
}

resource "google_compute_url_map" "this" {
  name            = "url-map-target-proxy-125-green"
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
  name        = "backend-125-green"
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 10

  health_checks = [google_compute_http_health_check.this.id]
}

resource "google_compute_http_health_check" "this" {
  name               = "c7n-check-backend-125-green"
  request_path       = "/"
  check_interval_sec = 1
  timeout_sec        = 1
}
