module "naming" {
  source = "../../shared_tf_modules/naming_gcp"

  prefix = "green"
}

resource "random_id" "common" {
  byte_length = 4
}
