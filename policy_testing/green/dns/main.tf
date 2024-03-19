module "naming" {
  source = "../../shared_tf_modules/naming_gcp"

  prefix = "green"
}

data "terraform_remote_state" "common" {
  backend = "local"

  config = {
    path = "../common_resources/terraform.tfstate"
  }
}