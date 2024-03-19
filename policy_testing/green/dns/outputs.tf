output "dns" {
  value = {
    dns-managed-zone = google_dns_managed_zone.this.name
  }
}