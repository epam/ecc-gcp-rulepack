resource "google_compute_autoscaler" "this" {
  name   = var.autoscaler_name
  zone   = "${var.region}-a"
  target = google_compute_instance_group_manager.this.id

  autoscaling_policy {
    max_replicas    = 2
    min_replicas    = 1
    cooldown_period = 60

    cpu_utilization {
      target = 0.7
    }
  }
}