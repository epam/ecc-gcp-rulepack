resource "google_compute_network" "this" {
  name                    = var.network_name
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "this" {
  name                     = var.subnet_name
  ip_cidr_range            = var.ip
  region                   = var.region
  network                  = google_compute_network.this.id
  private_ip_google_access = "false"
}