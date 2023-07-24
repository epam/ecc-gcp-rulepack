resource "google_cloud_run_service" "default" {
  name     = "cloudrun-265-green"
  location = var.region

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }

      service_account_name = google_service_account.this.email
    }
    metadata {
      labels = {
        custodiarule     = "ecc-gcp-263-run_revision_without_default_service_account"
        compliancestatus = "green"
      }
    }
  }


}
