resource "google_data_fusion_instance" "this" {
  name                          = module.naming.resource_prefix.datafusion
  region                        = var.region
  type                          = "DEVELOPER"
  enable_stackdriver_monitoring = false
  enable_stackdriver_logging    = false
  private_instance              = false
}
