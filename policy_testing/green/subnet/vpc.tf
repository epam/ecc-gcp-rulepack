resource "google_compute_network" "this" {
  name                    = "${module.naming.resource_prefix.vpc}-subnet"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "this" {
  name                     = module.naming.resource_prefix.subnetwork
  ip_cidr_range            = "10.5.0.0/20"
  region                   = var.region
  network                  = google_compute_network.this.id
  private_ip_google_access = true

  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 1.0
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

resource "google_container_cluster" "this" {
  name                     = "${module.naming.resource_prefix.cluster}-subnet"
  location                 = var.region
  deletion_protection      = false
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.this.name
  subnetwork               = google_compute_subnetwork.this.self_link

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "10.0.0.0/14"
    services_ipv4_cidr_block = "10.4.0.0/19"
  }

}