resource "google_container_cluster" "this" {
  name               = var.cluster_name
  location           = var.region
  network            = "default"
  initial_node_count = 1

  resource_labels = {
    custodianrule    = "ecc-gcp-057-network_policy_enabled_on_gke_clusters"
    compliancestatus = "red"
  }

  network_policy {
    enabled = false
  }
}
