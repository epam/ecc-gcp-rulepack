resource "google_dataproc_cluster" "this" {
  name   = "dataproc-cluster-${var.prefix}"
  region = var.region

  labels = {
    custodiarule     = "ecc-gcp-366-autoscaling-policy-configured-for-dataproc-clusters"
    compliancestatus = "green"
  }

  cluster_config {
    autoscaling_config {
      policy_uri = google_dataproc_autoscaling_policy.this.name
    }
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
    custodiarule     = "ecc-gcp-366-autoscaling-policy-configured-for-dataproc-clusters"
    compliancestatus = "green"
  }
}

resource "google_dataproc_autoscaling_policy" "this" {
  policy_id = "dataproc-policy-${var.prefix}"
  location  = var.region

  worker_config {
    max_instances = 3
  }

  basic_algorithm {
    yarn_config {
      graceful_decommission_timeout = "30s"

      scale_up_factor   = 0.5
      scale_down_factor = 0.5
    }
  }
}
