resource "google_compute_instance_group_manager" "this" {
  name = module.naming.resource_prefix.instance_group

  base_instance_name = module.naming.resource_prefix.instance_group
  zone               = var.zone

  version {
    instance_template = google_compute_instance_template.this.id
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.this.id
    initial_delay_sec = 300
  }
}