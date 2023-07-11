resource "google_compute_firewall" "this" {
  name      = var.firewall_name
  network   = google_compute_network.this.name
  direction = "INGRESS"

  allow {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]
}
