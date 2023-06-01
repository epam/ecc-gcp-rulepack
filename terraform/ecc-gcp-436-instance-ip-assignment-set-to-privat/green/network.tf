resource "google_compute_network" "this" {
  provider = google-beta

  name = var.network
}

resource "google_compute_global_address" "this" {
  provider = google-beta

  name          = var.address
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.this.id
}

resource "google_service_networking_connection" "this" {
  provider = google-beta

  network                 = google_compute_network.this.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.this.name]
}
