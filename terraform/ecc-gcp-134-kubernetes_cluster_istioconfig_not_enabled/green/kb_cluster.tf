resource "google_container_cluster" "this" {
  name               = var.cluster
  location           = var.region
  initial_node_count = var.node_count
  provider           = google-beta

  addons_config {
    istio_config {
      disabled = false
    }
  }

  resource_labels = {
    custodianrule    = "ecc-gcp-134-kubernetes_cluster_istioconfig_not_enabled"
    compliancestatus = "green"
  }
}
