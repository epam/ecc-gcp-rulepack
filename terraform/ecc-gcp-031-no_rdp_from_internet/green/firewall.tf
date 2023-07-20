resource "google_compute_firewall" "this" {
  name    = var.firewall_name
  network = var.network

  allow {
    protocol = "icmp"
  }

  source_ranges = ["10.0.0.0/16"]

}