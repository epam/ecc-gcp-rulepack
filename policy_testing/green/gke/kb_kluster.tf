data "google_project" "this" {}

resource "google_container_cluster" "this" {
  provider                    = google-beta
  name                        = module.naming.resource_prefix.cluster
  location                    = var.region
  network                     = google_compute_network.cluster.name
  subnetwork                  = google_compute_subnetwork.cluster.self_link
  remove_default_node_pool    = true
  enable_intranode_visibility = true
  deletion_protection         = false
  initial_node_count          = 1
  logging_service             = "logging.googleapis.com/kubernetes"
  monitoring_service          = "monitoring.googleapis.com/kubernetes"

  node_config {
    sandbox_config {
      sandbox_type = "gvisor"
    }
  }

  workload_identity_config {
    workload_pool = "${data.google_project.this.project_id}.svc.id.goog"
  }

  database_encryption {
    state    = "ENCRYPTED"
    key_name = data.terraform_remote_state.common.outputs.crypto_key_id_us_central
  }

  resource_labels = {
    test = "testing-c7n-policies"
  }

  binary_authorization {
    enabled = true
  }

  enable_legacy_abac = false

  release_channel {
    channel = "STABLE"
  }

  network_policy {
    enabled = true
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "10.0.0.0/14"
    services_ipv4_cidr_block = "10.4.0.0/19"
  }

  resource_usage_export_config {

    bigquery_destination {
      dataset_id = google_bigquery_dataset.cluster_bq.dataset_id
    }

    enable_network_egress_metering = true
  }

  networking_mode = "VPC_NATIVE"

  master_authorized_networks_config {}

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }
}

resource "google_container_node_pool" "this" {
  name       = module.naming.resource_prefix.node_pool
  cluster    = google_container_cluster.this.id
  node_count = 3


  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible       = true
    machine_type      = "e2-micro"
    boot_disk_kms_key = data.terraform_remote_state.common.outputs.crypto_key_id_us_central
    service_account   = google_service_account.cluster.email
    metadata = {
      disable-legacy-endpoints = true
    }
    shielded_instance_config {
      enable_secure_boot = true
    }
    workload_metadata_config {
      mode = "GKE_METADATA"
    }
  }
}

resource "google_compute_subnetwork" "cluster" {
  name                     = "${module.naming.resource_prefix.subnetwork}-cluster"
  ip_cidr_range            = "10.5.0.0/20"
  region                   = var.region
  network                  = google_compute_network.cluster.id
  private_ip_google_access = true
}

resource "google_compute_network" "cluster" {
  name                    = "${module.naming.resource_prefix.vpc}-cluster"
  auto_create_subnetworks = false
}

resource "google_bigquery_dataset" "cluster_bq" {
  dataset_id                  = replace("${module.naming.resource_prefix.bq_dataset}_cluster", "-", "_")
  location                    = var.region
  default_table_expiration_ms = 3600000
  delete_contents_on_destroy  = true
}

resource "google_service_account" "cluster" {
  account_id = "${module.naming.resource_prefix.sa}-k8s"
}