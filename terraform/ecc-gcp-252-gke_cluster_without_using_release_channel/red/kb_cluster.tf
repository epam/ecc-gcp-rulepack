resource "google_container_cluster" "this" {
  name               = var.cluster
  location           = var.region
  initial_node_count = var.node_count

  release_channel {
    channel = "UNSPECIFIED"
  }

  resource_labels = {
    custodiarule     = "ecc-gcp-252-gke_cluster_without_using_release_channel"
    compliancestatus = "red"
  }

}
