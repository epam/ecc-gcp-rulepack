resource "google_container_cluster" "this" {
  name               = var.cluster_name
  location           = var.region
  network            = "default"
  initial_node_count = 1

  resource_labels = {
    custodianrule    = "ecc-gcp-166-gke_specific_purpose_designed_network"
    compliancestatus = "red"
  }
}
