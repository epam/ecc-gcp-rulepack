output "disk" {
  value = {
    disk = google_compute_disk.this.name
  }
}