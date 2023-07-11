resource "google_container_cluster" "this" {
  name               = var.cluster
  location           = var.region
  initial_node_count = var.node_count

  resource_labels = {
    custodianrule    = "ecc-gcp-132-cluster_application-layer_secrets_not_encrypted"
    compliancestatus = "red"
  }
}
