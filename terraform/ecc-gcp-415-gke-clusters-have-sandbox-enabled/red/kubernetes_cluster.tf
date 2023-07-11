resource "google_container_cluster" "this" {
  name               = var.cluster_name
  location           = var.region
  initial_node_count = 1

  resource_labels = {
    custodianrule    = "ecc-gcp-415-gke-clusters-have-sandbox-enabled"
    compliancestatus = "red"
  }
}
