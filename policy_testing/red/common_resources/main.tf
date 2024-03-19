module "naming" {
  source = "../../shared_tf_modules/naming_gcp"

  prefix = "red"
}

data "google_project" "common" {}

output "project_number" {
  value = data.google_project.common.number
}