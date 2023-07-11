resource "google_container_cluster" "this" {
  name               = var.cluster_name
  location           = var.region
  initial_node_count = 1

  resource_labels = {
    custodiarule     = "ecc-gcp-058-authentication_using_client_certificates_disabled"
    compliancestatus = "red"
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = true
    }
  }
}
