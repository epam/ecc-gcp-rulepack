resource "google_container_cluster" "this" {
  name               = var.cluster
  location           = var.region
  initial_node_count = var.node_count

  addons_config {
    http_load_balancing {
      disabled = false
    }
  }

  resource_labels = {
    custodianrule    = "ecc-gcp-165-gke_http_load_balancer_enabled"
    compliancestatus = "green"
  }
}
