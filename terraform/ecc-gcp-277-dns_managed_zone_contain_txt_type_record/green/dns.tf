resource "google_dns_managed_zone" "this" {
  name     = var.dns_zone_name
  dns_name = "dns-${random_id.rnd.hex}.com."
}

resource "random_id" "rnd" {
  byte_length = 4
}

resource "google_dns_record_set" "this" {
  name         = "frontend.${google_dns_managed_zone.this.dns_name}"
  type         = "TXT"
  ttl          = 300
  managed_zone = google_dns_managed_zone.this.name
  rrdatas      = ["dns"]

  depends_on = [
    google_dns_managed_zone.this
  ]
}
