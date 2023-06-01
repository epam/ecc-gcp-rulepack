resource "google_compute_firewall" "this" {
  name    = var.firewall_name
  network = var.network

  allow {
    protocol = var.protocol
  }

  target_tags = var.tags
  source_ranges = ["0.0.0.0/0"]

}
