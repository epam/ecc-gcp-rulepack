data "google_compute_network" "this" {
  name = "default"
}

resource "google_compute_firewall" "this" {
  name    = var.firewall_name
  network = data.google_compute_network.this.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
}
