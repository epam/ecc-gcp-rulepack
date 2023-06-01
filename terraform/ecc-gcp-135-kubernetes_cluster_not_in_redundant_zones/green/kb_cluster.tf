resource "google_container_cluster" "this" {
  name               = var.cluster
  location           = var.region
  initial_node_count = var.node_count

  resource_labels = {
    custodianrule    = "ecc-gcp-135-kubernetes_cluster_not_in_redundant_zones"
    compliancestatus = "green"
  }
}
