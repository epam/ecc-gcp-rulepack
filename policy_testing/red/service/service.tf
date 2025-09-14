resource "null_resource" "this" {
  provisioner "local-exec" {
    when    = create
    command = "gcloud services disable cloudasset.googleapis.com"
  }
}

data "google_project" "this" {}