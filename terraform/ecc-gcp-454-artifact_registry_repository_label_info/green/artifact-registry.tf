resource "google_artifact_registry_repository" "this" {
  location      = var.region
  repository_id = "repository-${var.prefix}"
  format        = "DOCKER"

  labels = {
    custodiarule     = "ecc-gcp-454-artifact_registry_repository_label_info"
    compliancestatus = "green"
  }
}