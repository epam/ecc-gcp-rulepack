resource "google_compute_firewall" "ingress" {
  name      = "${module.naming.resource_prefix.firewall}-ingress-default"
  network   = "default"
  direction = "INGRESS"

  allow {
    protocol = "all"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "this" {
  name      = "${module.naming.resource_prefix.firewall}-egress-default"
  network   = "default"
  direction = "EGRESS"

  allow {
    protocol = "all"
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}