output "armor-policy" {
  value = {
    armor-policy = google_compute_security_policy.this.self_link
  }
}