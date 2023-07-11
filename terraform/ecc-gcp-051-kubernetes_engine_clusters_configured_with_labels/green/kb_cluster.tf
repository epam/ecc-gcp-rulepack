resource "google_container_cluster" "this" {
  name               = var.cluster
  location           = var.region
  initial_node_count = var.node_count

  resource_labels = {
    custodianrule    = "ecc-gcp-051-kubernetes_engine_clusters_configured_with_labels"
    compliancestatus = "green"
  }
}