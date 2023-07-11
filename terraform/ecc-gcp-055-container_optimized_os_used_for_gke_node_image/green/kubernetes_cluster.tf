resource "google_container_cluster" "this" {
  name               = var.cluster_name
  location           = var.region
  initial_node_count = 1
  min_master_version = "1.22"

  resource_labels = {
    custodianrule    = "ecc-gcp-055-container_optimized_os_used_for_gke_node_image"
    compliancestatus = "green"
  }

  node_config {
    image_type = "COS"
  }
}
