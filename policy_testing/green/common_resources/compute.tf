resource "google_compute_disk" "common" {
  name  = "${module.naming.resource_prefix.disk}-common"
  size  = 10
  image = "debian-cloud/${var.family}"
  type  = "pd-ssd"
  zone  = var.zone
}