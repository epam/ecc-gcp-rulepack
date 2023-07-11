resource "google_container_cluster" "this" {
  name               = var.cluster_name
  location           = var.region
  enable_legacy_abac = true

  node_pool {
    management {
      auto_repair = true
    }
  }
}
