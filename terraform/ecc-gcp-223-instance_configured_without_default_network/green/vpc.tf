resource "google_compute_network" "this" {
  project                 = var.project
  name                    = var.network
  auto_create_subnetworks = true
}