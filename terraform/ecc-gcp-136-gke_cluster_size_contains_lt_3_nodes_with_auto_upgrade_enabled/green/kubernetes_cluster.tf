resource "google_container_cluster" "this" {
  name     = var.cluster_name
  location = var.region

  node_pool {
    initial_node_count = 3
    management {
      auto_upgrade = true
    }
  }
}
