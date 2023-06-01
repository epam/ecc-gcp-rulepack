resource "google_container_cluster" "this" {
  name               = var.cluster_name
  location           = var.region
  enable_legacy_abac = false

  node_pool {
    management {
      auto_repair = true
    }
  }
}
