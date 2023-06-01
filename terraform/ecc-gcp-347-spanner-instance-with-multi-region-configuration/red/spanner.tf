resource "google_spanner_instance" "this" {
  name         = "spanner-instance-347-red"
  display_name = "spanner-instance-347-red"
  config       = "regional-us-central1"
  num_nodes    = 1

  labels = {
    custodianrule    = "ecc-gcp-347-spanner-instance-with-multi-region-configuration"
    compliancestatus = "red"
  }
}
