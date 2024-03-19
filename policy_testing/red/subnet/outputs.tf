output "subnet" {
  value = {
    subnet = google_compute_subnetwork.this.self_link
  }
}