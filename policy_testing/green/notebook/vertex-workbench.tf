resource "google_notebooks_instance" "this" {
  name         = "${module.naming.resource_prefix.notebooks_instance}-${random_id.this.hex}"
  location     = var.zone
  machine_type = "e2-medium"
  vm_image {
    project      = "deeplearning-platform-release"
    image_family = "common-cpu"
  }

  no_public_ip = true
}

resource "random_id" "this" {
  byte_length = 4
}