resource "google_cloud_run_service" "this" {
  name     = "cloudrun-264-green"
  location = var.region

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
        resources {
          limits = {
            cpu    = "1000m"
            memory = "512M"
          }
        }
      }
    }

    metadata {
      labels = {
        custodiarule     = "ecc-gcp-264-run_revision_without_vpc_connector"
        compliancestatus = "green"
      }

      annotations = {
        "autoscaling.knative.dev/maxScale"        = "5"
        "run.googleapis.com/vpc-access-connector" = google_vpc_access_connector.this.name
        "run.googleapis.com/vpc-access-egress"    = "all-traffic"
      }
    }
  }
  autogenerate_revision_name = true
}
