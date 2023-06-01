resource "google_container_cluster" "this" {
  name               = var.cluster_name
  location           = var.region
  initial_node_count = 1

  node_config {
    shielded_instance_config {
      enable_secure_boot = false
    }
  }

  resource_labels = {
    custodiarule     = "ecc-gcp-192-secure_boot_for_shielded_gke_nodes"
    compliancestatus = "red"
  }

}
