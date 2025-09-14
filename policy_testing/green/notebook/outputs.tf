output "notebook" {
  value = {
    notebook = google_notebooks_instance.this.id
  }
}