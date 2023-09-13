resource "google_dataproc_cluster" "this" {
  name   = "dataproc-cluster-${var.prefix}"
  region = var.region

  labels = {
    custodiarule     = "ecc-gcp-452-dataproc_cluster_label_info"
    compliancestatus = "green"
  }

  cluster_config {
    gce_cluster_config {
      network = var.network
    }
    staging_bucket = google_storage_bucket.this[0].name
    temp_bucket    = google_storage_bucket.this[1].name

    master_config {
      num_instances = 1
      machine_type  = "e2-medium"
      disk_config {
        boot_disk_type    = "pd-ssd"
        boot_disk_size_gb = 30
      }
    }

    worker_config {
      num_instances = 2
      machine_type  = "e2-medium"
      disk_config {
        boot_disk_type    = "pd-ssd"
        boot_disk_size_gb = 30
      }
    }
  }

  depends_on = [
    google_compute_firewall.this
  ]
}


resource "google_storage_bucket" "this" {
  count         = 2
  name          = count.index == 0 ? "dataproc-staging-bucket-${var.prefix}" : "dataproc-temp-bucket-${var.prefix}"
  location      = var.region
  force_destroy = true

  labels = {
    custodiarule     = "ecc-gcp-452-dataproc_cluster_label_info"
    compliancestatus = "green"
  }
}
