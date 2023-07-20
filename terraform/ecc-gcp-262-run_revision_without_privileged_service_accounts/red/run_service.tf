resource "google_cloud_run_service" "this" {
  name     = "cloudrun-262-red"
  location = var.region

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }

      service_account_name = google_service_account.this.email
    }
  }

  metadata {
    labels = {
      custodiarule     = "ecc-gcp-262-run_revision_without_privileged_service_accounts"
      compliancestatus = "red"
    }
  }

}
