resource "google_container_cluster" "this" {
  name               = var.cluster
  location           = var.region
  initial_node_count = var.node_count
  network            = google_compute_network.this.name
  subnetwork         = google_compute_subnetwork.this.self_link

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = var.cluster_secondary_range
    services_ipv4_cidr_block = var.service_secondary_range
  }

}