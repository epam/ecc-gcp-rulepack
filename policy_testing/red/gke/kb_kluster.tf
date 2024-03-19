resource "google_container_cluster" "this" {
  name                     = module.naming.resource_prefix.cluster
  location                 = var.region
  remove_default_node_pool = true
  initial_node_count       = 1
  min_master_version       = "1.25"
  logging_service          = "none"
  monitoring_service       = "none"
  deletion_protection      = false
  enable_shielded_nodes    = false

  networking_mode = "ROUTES"

  node_config {
    disk_type = "pd-standard"
    shielded_instance_config {
      enable_integrity_monitoring = false
    }
  }

  addons_config {
    http_load_balancing {
      disabled = true
    }
  }

  binary_authorization {
    enabled = false
  }

  enable_legacy_abac = true

  release_channel {
    channel = "UNSPECIFIED"
  }

  network_policy {
    enabled = false
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = true
    }
  }
  resource_usage_export_config {
    bigquery_destination {
      dataset_id = google_bigquery_dataset.cluster_bq.dataset_id
    }
    enable_network_egress_metering = false
  }
}

resource "google_container_node_pool" "this" {
  name       = module.naming.resource_prefix.node_pool
  cluster    = google_container_cluster.this.id
  node_count = 1


  management {
    auto_repair  = false
    auto_upgrade = false
  }

  node_config {
    preemptible  = false
    machine_type = "e2-micro"
    image_type   = "ubuntu_containerd"
    metadata = {
      disable-legacy-endpoints = false
    }
  }
}

resource "google_bigquery_dataset" "cluster_bq" {
  dataset_id                  = replace("${module.naming.resource_prefix.bq_dataset}_cluster", "-", "_")
  location                    = var.region
  default_table_expiration_ms = 3600000
  delete_contents_on_destroy  = true
}