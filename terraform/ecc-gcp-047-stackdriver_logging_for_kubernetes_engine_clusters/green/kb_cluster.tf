resource "google_container_cluster" "this" {
  name               = var.cluster
  location           = var.region
  initial_node_count = var.node_count
  logging_service    = var.logging

  resource_labels = {
    custodianrule    = "ecc-gcp-047-stackdriver_logging_for_kubernetes_engine_clusters"
    compliancestatus = "green"
  }
}
