resource "null_resource" "this" {
  provisioner "local-exec" {
    when    = create
    command = "gcloud services enable cloudasset.googleapis.com"
  }
  provisioner "local-exec" {
    when    = destroy
    command = "gcloud services disable cloudasset.googleapis.com"
  }
}

data "google_project" "this" {}

output "service" {
  value = "projects/${data.google_project.this.number}/services/cloudasset.googleapis.com"
}