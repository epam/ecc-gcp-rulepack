resource "google_container_cluster" "this" {
  name                        = var.cluster_name
  location                    = var.region
  initial_node_count          = 1
  enable_binary_authorization = true

  resource_labels = {
    custodianrule    = "ecc-gcp-127-gke_clusters_have_binary_authorization"
    compliancestatus = "green"
  }
}
