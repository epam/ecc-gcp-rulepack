resource "google_cloud_run_service" "this" {
  name     = module.naming.resource_prefix.cloud_run
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
  }
}