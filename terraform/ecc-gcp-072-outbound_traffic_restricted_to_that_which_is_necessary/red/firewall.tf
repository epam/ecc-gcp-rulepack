resource "google_compute_firewall" "this" {
  name      = var.firewall_name
  network   = google_compute_network.this.name
  direction = "EGRESS"

  allow {
    protocol = "all"
  }
}
