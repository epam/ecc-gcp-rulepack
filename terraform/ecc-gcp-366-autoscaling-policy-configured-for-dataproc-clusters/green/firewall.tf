resource "google_compute_firewall" "this" {
  name    = "default-allow-internal-${var.prefix}"
  network = var.network

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["10.128.0.0/9"]

}
