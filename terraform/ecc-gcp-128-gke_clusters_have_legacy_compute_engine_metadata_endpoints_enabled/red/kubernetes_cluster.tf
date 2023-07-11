resource "google_container_cluster" "this" {
  name               = var.cluster_name
  location           = var.region
  initial_node_count = 1

  resource_labels = {
    custodianrule    = "ecc-gcp-128-gke_clusters_have_legacy_compute_endpoints_enabled",
    compliancestatus = "red"
  }

  node_config {
    metadata = {
      disable-legacy-endpoints = false
    }
  }
}

