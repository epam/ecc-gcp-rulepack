resource "google_container_cluster" "this" {
  name               = var.cluster
  location           = var.region
  initial_node_count = var.node_count

  master_authorized_networks_config {}
  resource_labels = {
    custodianrule    = "ecc-gcp-050-master_authorized_networks_enabled"
    compliancestatus = "green"
  }
}
