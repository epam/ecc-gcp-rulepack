resource "google_os_config_patch_deployment" "this" {
  patch_deployment_id = "patch-deploy-red-409"

  instance_filter {
    instances = [google_compute_instance.this.id]
  }

  one_time_schedule {
    execute_time = "2999-10-10T10:10:10.045123456Z"
  }
}
