resource "google_container_cluster" "this" {
  name               = var.cluster
  location           = var.region
  initial_node_count = var.node_count

  resource_labels = {
    custodiarule     = "ecc-gcp-450-preemptible_gke_vm"
    compliancestatus = "red"
  }

  node_config {
    machine_type = "e2-micro"
    labels = {
      custodiarule     = "ecc-gcp-450-preemptible_gke_vm"
      compliancestatus = "red"
    }
  }

}
