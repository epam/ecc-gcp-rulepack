resource "google_container_cluster" "this" {
  name                     = "cluster-${var.prefix}"
  location                 = var.region
  initial_node_count       = 1
  remove_default_node_pool = true

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  master_authorized_networks_config {}
  ip_allocation_policy {}
}
