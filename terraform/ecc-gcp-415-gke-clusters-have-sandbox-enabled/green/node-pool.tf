resource "google_container_node_pool" "this" {
  provider   = google-beta
  name       = var.pool_name
  location   = var.region
  cluster    = google_container_cluster.this.name
  node_count = 1

  node_config {
    machine_type = "g1-small"
    image_type   = "COS_CONTAINERD"

    sandbox_config {
      sandbox_type = "gvisor"
    }
  }
}
