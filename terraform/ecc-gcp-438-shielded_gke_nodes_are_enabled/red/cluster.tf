resource "google_container_cluster" "this" {
  name                  = var.cluster_name
  location              = var.region
  initial_node_count    = 1
  enable_shielded_nodes = false

  resource_labels = {
    custodianrule    = "ecc-gcp-438-shielded_gke_nodes_are_enabled"
    compliancestatus = "red"
  }

}
