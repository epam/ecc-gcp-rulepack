resource "google_container_cluster" "this" {
  name                        = var.cluster_name
  location                    = var.region
  initial_node_count          = 1
  enable_intranode_visibility = true

  resource_labels = {
    custodiarule     = "ecc-gcp-193-vpc_flow_logs_and_intranode_visibility"
    compliancestatus = "green"
  }
}
