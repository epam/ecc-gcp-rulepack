resource "google_container_cluster" "this" {
  name                     = "cluster-${var.prefix}"
  location                 = var.region
  initial_node_count       = 1
  remove_default_node_pool = true

  private_cluster_config {
    enable_private_endpoint = false
  }
}
