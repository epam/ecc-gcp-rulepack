resource "google_compute_firewall" "this" {
  name    = var.firewall_name
  network = var.network

  allow {
    protocol = "tcp"
  }

  source_tags = ["green"]

}
