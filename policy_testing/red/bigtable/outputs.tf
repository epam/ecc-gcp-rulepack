output "bigtable" {
  value = {
    bigtable-instance-cluster        = google_bigtable_instance.this.id
    bigtable-instance-cluster-backup = "projects/${var.project}/instances/${module.naming.resource_prefix.bigtable_instance}/clusters/${module.naming.resource_prefix.bigtable_instance}/backups/${module.naming.resource_prefix.bigtable_backup}"
  }
}