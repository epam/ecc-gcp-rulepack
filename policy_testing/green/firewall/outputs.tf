output "firewall" {
  value = {
    firewall                                                          = google_compute_firewall.this.name
    ecc-gcp-071-inbound_traffic_restricted_to_that_which_is_necessary = google_compute_firewall.ingress.name
  }
}