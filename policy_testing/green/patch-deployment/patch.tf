resource "google_os_config_patch_deployment" "this" {
  patch_deployment_id = module.naming.resource_prefix.patch_deployment

  instance_filter {
    instances = [google_compute_instance.this.id]
  }

  patch_config {
    apt {
      type     = "DIST"
      excludes = ["python"]
    }
  }

  recurring_schedule {
    time_zone {
      id = "America/New_York"
    }

    time_of_day {
      hours   = 0
      minutes = 30
      seconds = 30
      nanos   = 20
    }

    monthly {
      month_day = 1
    }
  }
}
