resource "google_bigtable_instance" "this" {
  name                = var.iname
  deletion_protection = "false"

  cluster {
    cluster_id   = "instance-cluster-260-green"
    zone         = var.clusterzone
    num_nodes    = 1
    storage_type = "HDD"
  }

}

resource "google_bigtable_table" "this" {
  name          = var.tname
  instance_name = google_bigtable_instance.this.name
}
