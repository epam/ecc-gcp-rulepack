resource "google_notebooks_instance" "this" {
  name         = "my-notebook-304-red"
  location     = var.zone
  machine_type = "e2-medium"
  vm_image {
    project      = "deeplearning-platform-release"
    image_family = "common-cpu"
  }

  no_public_ip = false

  labels = {
    custodianrule    = "ecc-gcp-304-vertex-ai-workbench-does-not-have-public-ips"
    compliancestatus = "red"
  }

}
