# it is the first peering configuration that establishes the intent to connect to the second network
resource "google_compute_network_peering" "peering1" {
  name         = var.network_peering_one_name
  network      = google_compute_network.network1.id
  peer_network = google_compute_network.network2.id
}

# it is the second peering configuration that establishes the intent to connect to the first network
resource "google_compute_network_peering" "peering2" {
  name         = var.network_peering_two_name
  network      = google_compute_network.network2.id
  peer_network = google_compute_network.network1.id
}

# it is the first peering network
resource "google_compute_network" "network1" {
  name                    = var.first_network_name
  auto_create_subnetworks = "false"
}

# it is the second peering network
resource "google_compute_network" "network2" {
  name                    = var.second_network_name
  auto_create_subnetworks = "false"
}