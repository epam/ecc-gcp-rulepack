output "api-key" {
  value = {
    api-key = "projects/${data.terraform_remote_state.common.outputs.project_number}/locations/global/keys/${google_apikeys_key.this.name}"
  }
}