resource "google_data_fusion_instance" "this" {
  name             = "instance-412-red"
  region           = var.region
  type             = "DEVELOPER"
  private_instance = false

  labels = {
    custodiarule     = "ecc-gcp-412-data-fusion-instance-has-public-ip"
    compliancestatus = "red"
  }
}
