
locals {
  vpc_exist_bool = tonumber(data.external.script_to_check_vpc.result.vpc_exist_bool)
}

data "external" "script_to_check_vpc" {
  program = ["bash", "../../scripts/gcp_tf_scripts.sh", "default", "${var.region}", "vpc"]
}

resource "google_compute_network" "default" {
  count = local.vpc_exist_bool
  name  = "default"
}

data "google_compute_network" "default" {
  count = local.vpc_exist_bool == 0 ? 1 : 0
  name  = "default"
}


resource "google_compute_network" "network1" {
  name                    = "${module.naming.resource_prefix.vpc}-peering1"
  auto_create_subnetworks = false
}

# it is the second peering network
resource "google_compute_network" "network2" {
  name                    = "${module.naming.resource_prefix.vpc}-peering2"
  auto_create_subnetworks = "false"
}

resource "google_compute_network_peering" "this" {
  # 076 red
  name         = module.naming.resource_prefix.peering
  network      = google_compute_network.network1.id
  peer_network = google_compute_network.network2.id
}

resource "google_compute_firewall" "this" {
  name      = "${module.naming.resource_prefix.firewall}-vpc"
  network   = google_compute_network.network1.name
  priority  = 1
  direction = "EGRESS"

  deny {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}