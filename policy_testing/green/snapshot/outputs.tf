output "snapshot" {
  value = {
    snapshot = google_compute_snapshot.this.self_link
  }
}