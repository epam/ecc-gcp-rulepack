resource "google_compute_network" "this" {
  project                 = var.project
  name                    = "${module.naming.resource_prefix.vpc}-vm"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "this" {
  name          = "${module.naming.resource_prefix.subnetwork}-vm"
  ip_cidr_range = "10.2.0.0/16"
  region        = var.region
  network       = google_compute_network.this.id
}