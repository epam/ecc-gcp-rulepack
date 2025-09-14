output "loadbalancer" {
  value = {
    loadbalancer-backend-service                            = google_compute_backend_service.this2.self_link
    loadbalancer-ssl-certificate                            = google_compute_managed_ssl_certificate.this.self_link
    loadbalancer-ssl-policy                                 = google_compute_ssl_policy.this.self_link
    loadbalancer-target-https-proxy                         = google_compute_target_https_proxy.this.self_link
    ecc-gcp-092-remove_weak_ciphers_for_load_balancer       = google_compute_ssl_policy.this.self_link
    ecc-gcp-091-encrypted_connection_between_cdn_and_server = google_compute_backend_service.this.self_link
  }
}