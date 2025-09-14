output "image" {
  value = {
    image = google_compute_image.this.self_link
  }
}