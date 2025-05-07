output "instance" {
  value = {
    instance-group-manager                                            = google_compute_instance_group_manager.this.self_link
    ecc-gcp-197-compute_instances_have_confidential_computing_enabled = google_compute_instance.this2.self_link
    ecc-gcp-448-preemptible_vm                                        = google_compute_instance.this2.self_link
    instance                                                          = google_compute_instance.this.self_link
    instance-template                                                 = google_compute_instance_template.this.self_link
  }
}