resource "google_container_cluster" "this" {
  name                     = var.cluster
  location                 = var.region
  initial_node_count       = var.node_count
  remove_default_node_pool = true

  resource_labels = {
    custodiarule     = "ecc-gcp-450-preemptible_gke_vm"
    compliancestatus = "green"
  }

}

resource "google_container_node_pool" "this" {
  name       = "node-pool-450-green"
  location   = var.region
  cluster    = google_container_cluster.this.name
  node_count = var.node_count
  node_config {
    preemptible  = true
    machine_type = "e2-micro"
    labels = {
      custodiarule     = "ecc-gcp-450-preemptible_gke_vm"
      compliancestatus = "green"
    }
  }
}
