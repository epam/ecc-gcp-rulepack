resource "google_container_cluster" "this" {
  provider           = google-beta
  name               = var.cluster_name
  location           = var.region
  initial_node_count = 1
  min_master_version = "1.22"

  resource_labels = {
    custodianrule    = "ecc-gcp-060-pod_security_policy_enabled_on_gke_clusters",
    compliancestatus = "green"
  }

  pod_security_policy_config {
    enabled = "true"
  }
}
