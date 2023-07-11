resource "google_container_cluster" "this" {
  name               = var.cluster
  location           = var.region
  initial_node_count = var.node_count

  resource_labels = {
    custodianrule    = "ecc-gcp-133-kubernetes_cluster_intra-node_visibility_disabled"
    compliancestatus = "red"
  }
}
