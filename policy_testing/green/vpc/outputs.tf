output "vpc" {
  value = {
    vpc                            = google_compute_network.network1.self_link
    ecc-gcp-025-no_default_network = local.vpc_exist_bool == 1 ? "" : data.google_compute_network.default[0].self_link
  }
}