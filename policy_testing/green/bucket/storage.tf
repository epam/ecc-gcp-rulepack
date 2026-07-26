resource "random_id" "this" {
  byte_length = 4
}

resource "google_storage_bucket" "this" {
  name                        = "${module.naming.resource_prefix.bucket}-${random_id.this.hex}"
  location                    = "US"
  uniform_bucket_level_access = true
  default_event_based_hold    = true
  storage_class               = "MULTI_REGIONAL"

  retention_policy {
    retention_period = "10000000"
  }

  encryption {
    default_kms_key_name = data.terraform_remote_state.common.outputs.crypto_key_id_us
  }

  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type = "Delete"
    }
  }

  logging {
    log_bucket = "log_bucket_green-${random_id.this.hex}"
  }
}