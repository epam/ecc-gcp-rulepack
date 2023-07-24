resource "google_vpc_access_connector" "this" {
  name           = "vpc-connector-264-green"
  region         = var.region
  ip_cidr_range  = "10.8.0.0/28"
  max_throughput = 300
  network        = "default"
}