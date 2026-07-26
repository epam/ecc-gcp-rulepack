resource "google_bigtable_instance" "this" {
  name                = module.naming.resource_prefix.bigtable_instance
  deletion_protection = "false"

  cluster {
    cluster_id   = module.naming.resource_prefix.bigtable_instance
    zone         = var.zone
    num_nodes    = 1
    storage_type = "HDD"
    kms_key_name = data.terraform_remote_state.common.outputs.crypto_key_id_us_central
  }

}

resource "google_bigtable_table" "this" {
  name          = module.naming.resource_prefix.bigtable_table
  instance_name = google_bigtable_instance.this.name
}

resource "null_resource" "this" {
  triggers = {
    bigtable_backup   = module.naming.resource_prefix.bigtable_backup
    bigtable_instance = google_bigtable_instance.this.name
    bigtable_table    = google_bigtable_table.this.name
  }

  provisioner "local-exec" {
    command = join(" ", [
      "gcloud bigtable backups create ${self.triggers.bigtable_backup}",
      "--instance=${self.triggers.bigtable_instance}",
      "--table=${self.triggers.bigtable_table}",
      "--cluster=${self.triggers.bigtable_instance}",
      "--retention-period=30d"
      ]
    )
  }

  provisioner "local-exec" {
    when = destroy
    command = join(" ", [
      "gcloud bigtable backups delete ${self.triggers.bigtable_backup}",
      "--instance=${self.triggers.bigtable_instance}",
      "--cluster=${self.triggers.bigtable_instance}",
      "-q"
      ]
    )
  }
}