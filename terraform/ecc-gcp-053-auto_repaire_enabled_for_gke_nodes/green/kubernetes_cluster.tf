resource "google_container_cluster" "this" {
  name     = var.cluster_name
  location = var.region

  resource_labels = {
    custodianrule    = "ecc-gcp-053-auto_repaire_enabled_for_gke_nodes"
    compliancestatus = "green"
  }

  node_pool {
    management {
      auto_repair = true
    }
  }
}
