data "google_project" "this" {}

resource "google_container_cluster" "this" {
  name               = var.cluster
  location           = var.region
  initial_node_count = var.node_count

  workload_identity_config {
    workload_pool = "${data.google_project.this.project_id}.svc.id.goog"
  }

  node_config {
    workload_metadata_config {
      mode = "GKE_METADATA"
    }
  }

  resource_labels = {
    custodianrule    = "ecc-gcp-253-workload_identity_disabled_for_gke_cluster"
    compliancestatus = "green"
  }
}
