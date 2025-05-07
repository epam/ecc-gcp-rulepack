resource "google_spanner_instance" "this" {
  name         = module.naming.resource_prefix.spanner_instance
  display_name = module.naming.resource_prefix.spanner_instance
  config       = "nam-eur-asia1"
  num_nodes    = 1
}

resource "google_spanner_database" "this" {
  instance            = google_spanner_instance.this.name
  name                = module.naming.resource_prefix.spanner_database
  deletion_protection = false
}

resource "null_resource" "this" {
  triggers = {
    spanner_backup_name   = module.naming.resource_prefix.spanner_backup
    spanner_db_name       = google_spanner_database.this.name
    spanner_instance_name = google_spanner_instance.this.name
  }

  provisioner "local-exec" {
    command = join(" ", [
      "gcloud spanner backups create ${self.triggers.spanner_backup_name}",
      "--instance=${self.triggers.spanner_instance_name}",
      "--database=${self.triggers.spanner_db_name}",
      "--retention-period=30d",
      "--async"
      ]
    )
  }

  provisioner "local-exec" {
    when = destroy
    command = join(" ", [
      "gcloud spanner backups delete ${self.triggers.spanner_backup_name}",
      "--instance=${self.triggers.spanner_instance_name}",
      "--quiet"
      ]
    )
  }
}