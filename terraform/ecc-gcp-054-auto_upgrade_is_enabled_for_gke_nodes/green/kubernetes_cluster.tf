resource "google_container_cluster" "this" {
  name     = var.cluster_name
  location = var.region

  resource_labels = {
    custodianrule    = "ecc-gcp-054-auto_upgrade_is_enabled_for_gke_nodes"
    compliancestatus = "green"
  }

  node_pool {
    management {
      auto_upgrade = true
    }
  }
}
