resource "google_bigtable_instance" "this" {
  name                = "instance-317-red"
  deletion_protection = "false"

  cluster {
    cluster_id   = "instance-cluster-317-red"
    num_nodes    = 1
    storage_type = "HDD"
    zone         = var.zone
  }

  labels = {
    custodiarule     = "ecc-gcp-317-bigtable-instance-cluster-encryption-cmek"
    compliancestatus = "red"
  }
}
