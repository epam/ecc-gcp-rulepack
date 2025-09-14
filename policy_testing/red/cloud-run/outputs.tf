output "cloud-run" {
  value = {
    cloud-run-revision = local.revision_name
    cloud-run-service  = google_cloud_run_service.this.name
  }
}

locals {
  revision_name = data.external.script.result.revision_name
}

data "external" "script" {
  program = ["bash", "../../scripts/gcp_tf_scripts.sh", "${google_cloud_run_service.this.name}", "${var.region}", "cloud-run"]
}
