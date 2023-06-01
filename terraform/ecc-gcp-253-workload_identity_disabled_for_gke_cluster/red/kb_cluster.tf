resource "google_container_cluster" "this" {
  name               = var.cluster
  location           = var.region
  initial_node_count = var.node_count

  resource_labels = {
    custodianrule    = "ecc-gcp-253-workload_identity_disabled_for_gke_cluster"
    compliancestatus = "red"
  }
}
