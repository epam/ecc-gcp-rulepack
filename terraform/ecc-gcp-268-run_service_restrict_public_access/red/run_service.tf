resource "google_cloud_run_service" "this" {
  name     = "cloudrun-268-red"
  location = var.region

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
  }

  metadata {
    labels = {
      custodiarule     = "ecc-gcp-268-run_service_restrict_public_access"
      compliancestatus = "red"
    }
  }
}
