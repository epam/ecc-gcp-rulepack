resource "google_bigtable_instance" "this" {
  name                = "instance-${var.prefix}"
  deletion_protection = "false"

  cluster {
    cluster_id   = "instance-cluster-${var.prefix}"
    num_nodes    = 1
    storage_type = "HDD"
    zone         = var.zone
  }

  labels = {
    custodiarule     = "ecc-gcp-317-bigtable-instance-cluster-encryption-cmek"
    compliancestatus = "red"
  }
}
