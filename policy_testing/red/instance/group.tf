resource "google_compute_instance_group_manager" "this" {
  name = module.naming.resource_prefix.instance_group

  base_instance_name = module.naming.resource_prefix.instance_group
  zone               = var.zone

  version {
    instance_template = google_compute_instance_template.this.id
  }
}