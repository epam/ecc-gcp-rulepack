resource "google_cloud_run_service" "default" {
  name     = "cloudrun-265-red"
  location = var.region

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
    metadata {
      labels = {
        custodiarule     = "ecc-gcp-263-run_revision_without_default_service_account"
        compliancestatus = "red"
      }
    }
  }


  traffic {
    percent         = 100
    latest_revision = true
  }


}
