resource "google_container_cluster" "this" {
  name                     = var.cluster
  location                 = var.region
  initial_node_count       = 1
  remove_default_node_pool = true
  resource_labels = {
    custodianrule    = "ecc-gcp-251-restricted_privileged_access_for_gke"
    compliancestatus = "red"
  }
}

resource "google_container_node_pool" "this" {
  name       = "node-pool-251-red"
  location   = var.region
  cluster    = google_container_cluster.this.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    service_account = google_service_account.this.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
