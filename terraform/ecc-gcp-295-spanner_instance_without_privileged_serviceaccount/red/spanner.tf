resource "google_spanner_instance" "this" {
  name         = "spanner-instance-295-red"
  display_name = "spanner-instance-295-red"
  config       = "regional-us-central1"
  num_nodes    = 1

  labels = {
    custodianrule    = "ecc-gcp-295-spanner_instance_without_privileged_serviceaccount"
    compliancestatus = "red"
  }
}
