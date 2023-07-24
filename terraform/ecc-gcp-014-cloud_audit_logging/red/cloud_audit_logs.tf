resource "google_project_iam_audit_config" "this" {
  project = var.project
  service = "allServices"
  audit_log_config {
    log_type = "DATA_READ"
  }
}