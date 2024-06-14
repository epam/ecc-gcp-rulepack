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
      service_account_name = google_service_account.this.email
    }
    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale"        = "5"
        "run.googleapis.com/vpc-access-connector" = google_vpc_access_connector.this.name
        "run.googleapis.com/vpc-access-egress"    = "private-ranges-only"
        "run.googleapis.com/ingress"              = "internal"
      }
    }

  }

  autogenerate_revision_name = true
}

resource "google_service_account" "this" {
  account_id   = "${module.naming.resource_prefix.sa}-cloud-run"
  display_name = "${module.naming.resource_prefix.sa}-cloud-run"
}

resource "google_project_iam_member" "this" {
  project = var.project
  role    = "roles/run.developer"
  member  = "serviceAccount:${google_service_account.this.account_id}@${var.project}.iam.gserviceaccount.com"
}

resource "google_vpc_access_connector" "this" {
  name           = module.naming.resource_prefix.vpc_connector
  region         = var.region
  ip_cidr_range  = "10.8.0.0/28"
  max_throughput = 300
  network        = "default"
}