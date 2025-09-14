output "spanner" {
  value = {
    spanner-instance = "projects/${var.project}/instances/${google_spanner_instance.this.name}"
    spanner-backup   = "projects/${var.project}/instances/${google_spanner_instance.this.name}/backups/${module.naming.resource_prefix.spanner_backup}"
  }
}