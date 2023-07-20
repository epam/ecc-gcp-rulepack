resource "google_compute_instance_group_manager" "this" {
  name = var.group_name

  base_instance_name = "app"
  zone               = "us-central1-a"

  version {
    instance_template = google_compute_instance_template.this.id
  }


  auto_healing_policies {
    health_check      = google_compute_health_check.this.id
    initial_delay_sec = 300
  }
}
