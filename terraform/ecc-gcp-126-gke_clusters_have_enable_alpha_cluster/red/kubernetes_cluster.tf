resource "google_container_cluster" "this" {
  name                    = var.cluster_name
  location                = var.region
  enable_kubernetes_alpha = true

  resource_labels = {
    custodiarule     = "ecc-gcp-126-gke_clusters_have_enable_alpha_cluster"
    compliancestatus = "red"
  }

  node_pool {
    management {
      auto_upgrade = false
      auto_repair  = false
    }
  }
}

