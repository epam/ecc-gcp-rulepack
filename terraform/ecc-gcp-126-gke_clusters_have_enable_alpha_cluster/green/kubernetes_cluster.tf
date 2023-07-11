resource "google_container_cluster" "this" {
  name                    = var.cluster_name
  location                = var.region
  initial_node_count      = 1
  enable_kubernetes_alpha = false

  resource_labels = {
    custodianrule    = "ecc-gcp-126-gke_clusters_have_enable_alpha_cluster"
    compliancestatus = "green"
  }
}
