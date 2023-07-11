resource "google_vpc_access_connector" "this" {
  name          = "vpc-con-246-green"
  ip_cidr_range = "10.8.0.0/28"
  network       = "default"
}