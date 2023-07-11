resource "google_container_cluster" "this" {
  name     = var.cluster_name
  location = var.region

  resource_labels = {
    custodianrule    = "ecc-gcp-415-gke-clusters-have-sandbox-enabled"
    compliancestatus = "green"
  }

  remove_default_node_pool = true
  initial_node_count       = 1
}
