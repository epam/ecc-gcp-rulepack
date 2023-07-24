resource "google_cloud_run_service" "this" {
  name     = "cloudrun-265-red"
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
      custodiarule     = "ecc-gcp-264-run_revision_without_vpc_connector"
      compliancestatus = "red"
    }
  }

}
