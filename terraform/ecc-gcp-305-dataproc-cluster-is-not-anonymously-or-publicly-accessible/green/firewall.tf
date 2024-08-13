resource "google_compute_firewall" "this" {
  name    = var.firewall_name
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
