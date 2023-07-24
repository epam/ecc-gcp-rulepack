resource "google_container_cluster" "this" {
  name               = "cluster-${var.prefix}"
  location           = var.region
  initial_node_count = 1

  resource_labels = {
    custodianrule    = "ecc-gcp-434-cmek_for_gke_persistent_disks"
    compliancestatus = "green"
  }

  node_config {
    boot_disk_kms_key = google_kms_crypto_key.this.id
    disk_type         = "pd-standard"
  }

}
