resource "google_compute_subnetwork" "this" {
  name          = var.subnetwork_name
  ip_cidr_range = var.subnetwork_range
  region        = var.region
  network       = google_compute_network.this.id
}

resource "google_compute_network" "this" {
  name                    = var.network_name
  auto_create_subnetworks = false
}