resource "google_compute_disk" "this" {
  name  = module.naming.resource_prefix.disk
  zone  = var.zone
  type  = "pd-ssd"
  size  = 10
  image = "debian-cloud/${var.family}"
}
