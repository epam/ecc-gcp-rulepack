resource "google_artifact_registry_repository_iam_binding" "this" {
  provider   = google-beta
  location   = google_artifact_registry_repository.this.location
  repository = google_artifact_registry_repository.this.name
  role       = "roles/artifactregistry.reader"

  members = [
    "group:test@test.com",
  ]
}

resource "google_artifact_registry_repository" "this" {
  location      = var.region
  repository_id = "repository-307-green"
  format        = "DOCKER"
}