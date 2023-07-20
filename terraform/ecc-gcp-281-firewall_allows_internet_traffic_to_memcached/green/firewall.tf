resource "google_compute_firewall" "this" {
  name    = var.firewall_name
  network = var.network

  allow {
    protocol = "icmp"
  }

  source_tags = ["green"]

}
