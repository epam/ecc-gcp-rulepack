resource "google_container_cluster" "this" {
  name               = var.cluster_name
  location           = var.region
  initial_node_count = 1

  resource_labels = {
    custodianrule    = "ecc-gcp-063-no_default_service_account_for_kubernetes_clusters"
    compliancestatus = "green"
  }

  node_config {
    service_account = google_service_account.this.email
  }
}
