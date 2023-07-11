resource "google_container_cluster" "this" {
  name               = var.cluster
  location           = var.region
  initial_node_count = var.node_count
  min_master_version = var.min_master_version

  release_channel {
    channel = "UNSPECIFIED"
  }

  resource_labels = {
    custodiarule     = "ecc-gcp-123-gke_unsupported_master_node_version"
    compliancestatus = "red"
  }

}
