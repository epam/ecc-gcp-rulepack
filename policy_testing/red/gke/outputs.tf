output "gke" {
  value = {
    gke-cluster = google_container_cluster.this.name
    gke-nodepool = "${google_container_cluster.this.attributes.self_link}/nodePools/default-pool" # google_container_node_pool.this.name
  }
}