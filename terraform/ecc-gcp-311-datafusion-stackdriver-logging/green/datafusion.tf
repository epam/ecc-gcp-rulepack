resource "google_data_fusion_instance" "this" {
  name                       = "instance-311-green"
  region                     = var.region
  type                       = "DEVELOPER"
  enable_stackdriver_logging = true

  labels = {
    custodiarule     = "ecc-gcp-311-datafusion-stackdriver-logging"
    compliancestatus = "green"
  }
}
