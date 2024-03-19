resource "google_container_cluster" "this" {
  name     = module.naming.resource_prefix.cluster
  location = var.region
  # remove_default_node_pool = true
  initial_node_count = 1
  min_master_version = "1.25" # 123, 124 red
  logging_service    = "none"
  monitoring_service = "none"
  # enable_kubernetes_alpha = true
  deletion_protection   = false
  enable_shielded_nodes = false

  node_config {
    preemptible  = true
    machine_type = "e2-micro"
    image_type   = "ubuntu_containerd"
    disk_type    = "pd-standard"
    metadata = {
      disable-legacy-endpoints = false
    }

  }

  networking_mode = "ROUTES"

  addons_config {
    http_load_balancing {
      disabled = true
    }
  }

  cluster_autoscaling {
    auto_provisioning_defaults {
      management {
        auto_upgrade = false
        auto_repair  = false
      }
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

# resource "google_container_node_pool" "this" {
#   name       = module.naming.resource_prefix.node_pool
#   cluster    = google_container_cluster.this.id
#   node_count = 1


#   management {
#     auto_repair  = false # 053 red
#     auto_upgrade = false # 054 red
#   }

#   node_config {
#     preemptible  = true
#     machine_type = "e2-micro"
#     image_type   = "ubuntu_containerd" # 055 red
#     metadata = {
#       disable-legacy-endpoints = false # 128 red
#     }
#   }
# }

resource "google_bigquery_dataset" "cluster_bq" {
  dataset_id                  = replace("${module.naming.resource_prefix.bq_dataset}_cluster", "-", "_")
  location                    = var.region
  default_table_expiration_ms = 3600000
  delete_contents_on_destroy  = true
}