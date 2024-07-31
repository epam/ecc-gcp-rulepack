resource "null_resource" "this1" {

  provisioner "local-exec" {
    when    = create
    command = "gcloud spanner backups create ${var.spanner-bu} --instance=${var.spanner-i} --database=${var.spanner-db} --retention-period=6h"
  }

  depends_on = [google_spanner_database.this]
}

resource "null_resource" "this2" {

  provisioner "local-exec" {
    when    = create
    command = "gcloud spanner backups add-iam-policy-binding ${var.spanner-bu} --instance=${var.spanner-i} --member='serviceAccount:${var.sa}@${var.project}.iam.gserviceaccount.com' --role='roles/editor'"
  }

  depends_on = [null_resource.this1]
}

resource "null_resource" "this3" {
  triggers = {
    inst = var.spanner-i
    bu   = var.spanner-bu
  }

  provisioner "local-exec" {
    when    = destroy
    command = "gcloud spanner backups delete ${self.triggers.bu} --instance=${self.triggers.inst} --quiet"
  }

  depends_on = [google_spanner_database.this]
}