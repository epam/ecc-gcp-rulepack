resource "google_compute_firewall" "this" {
  name      = var.firewall_name
  network   = google_compute_network.this.name
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["80", "8080"]
  }

  source_tags = ["green"]
}
