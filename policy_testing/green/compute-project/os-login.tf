resource "null_resource" "this" {
  provisioner "local-exec" {
    command = join(" ", [
      "gcloud compute project-info add-metadata",
      "--metadata enable-oslogin=TRUE"
      ]
    )
  }
}