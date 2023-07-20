resource "google_compute_instance_group_manager" "this" {
  name = var.group_name

  base_instance_name = "app"
  zone               = "us-central1-a"

  version {
    instance_template = google_compute_instance_template.this.id
  }
}
