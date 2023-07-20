
resource "google_compute_firewall" "this" {
  name    = var.firewall_name
  network = google_compute_network.this.self_link

  allow {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]
}
