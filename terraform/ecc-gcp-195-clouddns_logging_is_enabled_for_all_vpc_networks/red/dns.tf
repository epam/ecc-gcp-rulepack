resource "google_dns_policy" "this" {
  name = var.dns_policy_name

  networks {
    network_url = google_compute_network.this.id
  }

}