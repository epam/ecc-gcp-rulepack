resource "google_compute_firewall" "this" {
  name    = "${module.naming.resource_prefix.firewall}-allow-internal"
  network = "default"

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
