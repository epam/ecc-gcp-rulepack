resource "google_compute_network" "this" {
  name                    = "${module.naming.resource_prefix.vpc}-dataflow"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name          = "${module.naming.resource_prefix.subnetwork}-dataflow"
  ip_cidr_range = "10.2.0.0/16"
  region        = var.region
  network       = google_compute_network.this.id
}

resource "google_compute_global_address" "this" {
  name          = "${module.naming.resource_prefix.subnetwork}-datafusion-ip-alloc"
  address_type  = "INTERNAL"
  purpose       = "VPC_PEERING"
  prefix_length = 22
  network       = google_compute_network.this.id
}