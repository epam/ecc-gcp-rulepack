resource "google_compute_firewall" "this" {
  name    = var.firewall_name
  network = var.network

  allow {
    protocol = var.protocol
    ports    = var.port
  }

  source_ranges = ["0.0.0.0/0"]

}