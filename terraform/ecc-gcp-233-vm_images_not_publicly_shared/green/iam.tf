resource "google_compute_image_iam_member" "this" {
  project = google_compute_image.this.project
  image   = google_compute_image.this.name
  role    = "roles/compute.imageUser"
  member  = "group:test@test.com"
}