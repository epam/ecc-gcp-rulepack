resource "google_compute_instance_group_manager" "this" {
  name = var.group_name

  base_instance_name = "app-387-red"
  zone               = "${var.region}-a"

  version {
    instance_template = google_compute_instance_template.this.id
  }
}
