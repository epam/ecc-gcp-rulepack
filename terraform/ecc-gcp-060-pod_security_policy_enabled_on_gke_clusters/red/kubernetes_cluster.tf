resource "google_container_cluster" "this" {
  provider           = google-beta
  name               = var.cluster_name
  location           = var.region
  initial_node_count = 1

  resource_labels = {
    custodiarule     = "ecc-gcp-060-pod_security_policy_enabled_on_gke_clusters",
    compliancestatus = "red"
  }

  pod_security_policy_config {
    enabled = false
  }
}
