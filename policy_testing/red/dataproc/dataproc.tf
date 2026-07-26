resource "google_dataproc_cluster" "this" {
  name   = module.naming.resource_prefix.dataproc
  region = var.region

  cluster_config {
    gce_cluster_config {
      network          = "default"
      internal_ip_only = false
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

resource "random_id" "this" {
  byte_length = 4
}


resource "google_storage_bucket" "this" {
  count         = 2
  name          = count.index == 0 ? "dataproc-staging-bucket-${random_id.this.hex}" : "dataproc-temp-bucket-${random_id.this.hex}"
  location      = var.region
  force_destroy = true
}
