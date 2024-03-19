resource "google_compute_network" "firewall" {
  name                    = "${module.naming.resource_prefix.vpc}-firewall"
  auto_create_subnetworks = false
}

resource "google_compute_firewall" "ingress" {
  name      = "${module.naming.resource_prefix.firewall}-ingress-default"
  network   = google_compute_network.firewall.name
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_tags = ["green"]
}

resource "google_compute_firewall" "this" {
  name      = "${module.naming.resource_prefix.firewall}-egress-default"
  network   = google_compute_network.firewall.name
  direction = "EGRESS"

  allow {
    protocol = "tcp"
  }

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}