resource "google_container_cluster" "this" {
  name               = var.cluster
  location           = var.region
  initial_node_count = var.node_count

  resource_labels = {
    custodianrule    = "ecc-gcp-059-vpc-native_clusters"
    compliancestatus = "green"
  }

  ip_allocation_policy {}
  networking_mode = var.mode
}
