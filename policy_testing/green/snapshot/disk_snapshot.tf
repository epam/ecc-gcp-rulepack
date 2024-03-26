resource "google_compute_snapshot" "this" {
  name        = module.naming.resource_prefix.snapshot
  source_disk = data.terraform_remote_state.common.outputs.disk_name
  zone        = var.zone
}