resource "google_container_cluster" "this" {
  name               = var.cluster_name
  location           = var.region
  initial_node_count = 1

  resource_labels = {
    custodiarule     = "ecc-gcp-063-no_default_service_account_for_kubernetes_clusters"
    compliancestatus = "red"
  }
}
