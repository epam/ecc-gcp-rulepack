resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "mysql" {
  name                = "${module.naming.resource_prefix.db}-mysql-${random_id.this.hex}"
  database_version    = "MYSQL_5_7"
  region              = var.region
  deletion_protection = false

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      require_ssl  = false
      ipv4_enabled = true
      authorized_networks {
        value = "0.0.0.0/0"
      }
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
  name                = "${module.naming.resource_prefix.db}-postgresql-${random_id.this.hex}"
  database_version    = "POSTGRES_10"
  region              = var.region
  deletion_protection = false

  settings {
    disk_autoresize = false
    disk_size       = 10
    tier            = "db-f1-micro"
    ip_configuration {
      require_ssl  = false
      ipv4_enabled = true
      authorized_networks {
        value = "0.0.0.0/0"
      }
    }
    dynamic "database_flags" {
      for_each = var.db_flags_postgresql
      content {
        name  = database_flags.key
        value = database_flags.value
      }
    }
  }

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

resource "google_sql_user" "root_user" {
  name     = "root"
  instance = google_sql_database_instance.mysql.name
  host     = "0.0.0.0"
}

resource "google_sql_user" "admin_user" {
  name     = "admin"
  instance = google_sql_database_instance.mysql.name
  host     = "my.com"
}
