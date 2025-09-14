resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "mysql" {
  name                = "${module.naming.resource_prefix.db}-mysql-${random_id.this.hex}"
  database_version    = "MYSQL_8_0"
  region              = var.region
  deletion_protection = false

  settings {
    tier = "db-f1-micro"
    backup_configuration {
      binary_log_enabled = true
      enabled            = true
    }
    ip_configuration {
      require_ssl  = false
      ipv4_enabled = true
    }
    dynamic "database_flags" {
      for_each = var.db_flags_mysql
      content {
        name  = database_flags.key
        value = database_flags.value
      }
    }
  }

}

resource "google_sql_database_instance" "this" {
  name                = "${module.naming.resource_prefix.db}-postresql-${random_id.this.hex}"
  database_version    = "POSTGRES_15"
  region              = var.region
  deletion_protection = false
  encryption_key_name = data.terraform_remote_state.common.outputs.crypto_key_id_us_central

  settings {
    user_labels = {
      test = "testing-c7n-policies"
    }
    tier = "db-f1-micro"
    backup_configuration {
      point_in_time_recovery_enabled = true
      enabled                        = true
    }
    availability_type     = "REGIONAL"
    disk_autoresize_limit = 10
    disk_autoresize       = true
    ip_configuration {
      require_ssl     = true
      ipv4_enabled    = false
      private_network = google_compute_network.this.id
    }
    dynamic "database_flags" {
      for_each = var.db_flags_postgresql
      content {
        name  = database_flags.key
        value = database_flags.value
      }
    }
  }

  depends_on = [google_service_networking_connection.this]

}

resource "google_sql_database_instance" "sql" {
  name                = "${module.naming.resource_prefix.db}-sqlserver-${random_id.this.hex}"
  database_version    = "SQLSERVER_2017_STANDARD"
  region              = var.region
  deletion_protection = false
  root_password       = random_password.this.result

  settings {
    tier = "db-custom-1-3840"
    ip_configuration {
      require_ssl  = false
      ipv4_enabled = true
    }
    dynamic "database_flags" {
      for_each = var.db_flags_sql
      content {
        name  = database_flags.key
        value = database_flags.value
      }
    }
  }

}

resource "random_password" "this" {
  length           = 12
  special          = true
  override_special = "_%@"
}

resource "google_sql_user" "this" {
  name     = "test"
  instance = google_sql_database_instance.mysql.name
  host     = "256.256.256.0"
}

resource "google_compute_network" "this" {
  name                    = "${module.naming.resource_prefix.vpc}-sql"
  auto_create_subnetworks = false
}

resource "google_compute_global_address" "this" {
  name          = "${module.naming.resource_prefix.global_address}-sql"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.this.id
}

resource "google_service_networking_connection" "this" {
  network                 = google_compute_network.this.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.this.name]
}