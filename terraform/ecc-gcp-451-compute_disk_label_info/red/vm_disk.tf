resource "google_compute_disk" "this" {
  name  = var.name
  zone  = var.zone
  image = "debian-cloud/debian-10"
}
