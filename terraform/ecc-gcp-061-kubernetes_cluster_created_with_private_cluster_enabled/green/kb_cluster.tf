resource "google_container_cluster" "this" {
  name               = var.cluster
  location           = var.region
  initial_node_count = var.node_count

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = var.cidr_block
  }

  master_authorized_networks_config {}
  ip_allocation_policy {}
}
