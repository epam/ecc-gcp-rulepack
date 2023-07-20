resource "google_data_fusion_instance" "this" {
  name                       = "instance-311-red"
  region                     = var.region
  type                       = "DEVELOPER"
  enable_stackdriver_logging = false

  labels = {
    custodiarule     = "ecc-gcp-311-datafusion-stackdriver-logging"
    compliancestatus = "red"
  }
}
