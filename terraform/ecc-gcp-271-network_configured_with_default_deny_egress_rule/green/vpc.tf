resource "google_compute_network" "this" {
  name = var.network_name
}

resource "google_compute_firewall" "this" {
  name      = "firewall-271-green"
  network   = google_compute_network.this.name
  priority  = 65535
  direction = "EGRESS"

  deny {
    protocol = "all"
  }

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  source_ranges = ["0.0.0.0/0"]
}