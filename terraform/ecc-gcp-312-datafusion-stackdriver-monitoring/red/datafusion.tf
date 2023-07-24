resource "google_data_fusion_instance" "this" {
  name                          = "instance-312-red"
  region                        = var.region
  type                          = "DEVELOPER"
  enable_stackdriver_monitoring = false

  labels = {
    custodiarule     = "ecc-gcp-312-datafusion-stackdriver-monitoring"
    compliancestatus = "red"
  }
}
