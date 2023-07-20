resource "google_compute_network" "this" {
  name = var.network_name
}

resource "google_compute_firewall" "this" {
  name      = "firewall-271-red"
  network   = google_compute_network.this.name
  priority  = 1
  direction = "EGRESS"

  deny {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}