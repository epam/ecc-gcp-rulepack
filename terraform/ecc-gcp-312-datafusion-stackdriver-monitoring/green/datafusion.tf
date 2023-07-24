resource "google_data_fusion_instance" "this" {
  name                          = "instance-312-green"
  region                        = var.region
  type                          = "DEVELOPER"
  enable_stackdriver_monitoring = true

  labels = {
    custodiarule     = "ecc-gcp-312-datafusion-stackdriver-monitoring"
    compliancestatus = "green"
  }
}
