output "patch-deployment" {
  value = {
    patch-deployment = google_os_config_patch_deployment.this.id
  }
}