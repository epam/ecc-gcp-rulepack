resource "google_compute_global_forwarding_rule" "this" {
  name       = module.naming.resource_prefix.global_forwarding_rule
  target     = google_compute_target_ssl_proxy.this.id
  port_range = "443"
}

resource "google_compute_global_forwarding_rule" "this2" {
  name       = "${module.naming.resource_prefix.global_forwarding_rule}2"
  target     = google_compute_target_https_proxy.this.id
  port_range = "443"
}

resource "google_compute_ssl_policy" "this" {
  name            = module.naming.resource_prefix.target_ssl_policy
  profile         = "MODERN"
  min_tls_version = "TLS_1_0"
}

resource "google_compute_managed_ssl_certificate" "this" {
  name = module.naming.resource_prefix.managed_ssl_certificate

  managed {
    domains = ["sslcert.tf-test.club."]
  }
}

resource "google_compute_target_ssl_proxy" "this" {
  name             = module.naming.resource_prefix.target_ssl_proxy
  backend_service  = google_compute_backend_service.this.id
  ssl_certificates = [google_compute_managed_ssl_certificate.this.id]
  ssl_policy       = google_compute_ssl_policy.this.id
}

resource "google_compute_target_https_proxy" "this" {
  name             = module.naming.resource_prefix.target_https_proxy
  url_map          = google_compute_url_map.this.id
  ssl_certificates = [google_compute_managed_ssl_certificate.this.id]
  quic_override    = "DISABLE"
}

resource "google_compute_url_map" "this" {
  name            = module.naming.resource_prefix.url_map
  default_service = google_compute_backend_service.this2.id

  host_rule {
    hosts        = ["mysite.com"]
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = google_compute_backend_service.this2.id

    path_rule {
      paths   = ["/*"]
      service = google_compute_backend_service.this2.id
    }
  }
}

resource "google_compute_backend_service" "this" {
  name          = module.naming.resource_prefix.backend_service
  health_checks = [google_compute_health_check.this.id]
  protocol      = "SSL"
  enable_cdn    = true

  cdn_policy {
    signed_url_cache_max_age_sec = 7200
  }
}

resource "google_compute_backend_service" "this2" {
  name          = "${module.naming.resource_prefix.backend_service}2"
  health_checks = [google_compute_health_check.this.id]
  protocol      = "HTTP"
  enable_cdn    = false
}

resource "google_compute_health_check" "this" {
  name               = module.naming.resource_prefix.health_check
  check_interval_sec = 1
  timeout_sec        = 1

  ssl_health_check {
    port = "443"
  }
}
