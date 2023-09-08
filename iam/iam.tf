resource "random_id" "this" {
  byte_length = 4
}

resource "google_service_account" "this" {
  account_id   = "${var.serviceac}-${random_id.this.hex}"
  display_name = var.dname
}

resource "google_service_account_key" "this" {
  service_account_id = google_service_account.this.name
}

# Create credentials.json with private_key in current directory
resource "local_file" "this" {
  content  = base64decode(google_service_account_key.this.private_key)
  filename = "credentials.json"
}

resource "google_project_iam_member" "this" {
  project = var.project
  role    = google_project_iam_custom_role.this.name
  member  = "serviceAccount:${google_service_account.this.account_id}@${var.project}.iam.gserviceaccount.com"
}

resource "google_project_iam_custom_role" "this" {
  role_id = "iam_least_privilege_${random_id.this.hex}"
  title   = "The IAM Least Privilege Role #${random_id.this.hex}"
  permissions = [
    "resourcemanager.projects.getIamPolicy",
    "iam.serviceAccounts.list",
    "iam.serviceAccountKeys.list",
    "cloudkms.keyRings.list",
    "logging.sinks.list",
    "logging.logMetrics.get",
    "monitoring.alertPolicies.list",
    "dns.managedZones.list",
    "compute.firewalls.list",
    "compute.subnetworks.list",
    "compute.instances.list",
    "compute.projects.get",
    "compute.disks.list",
    "storage.buckets.list",
    "cloudsql.instances.list",
    "container.clusters.list",
    "compute.backendServices.list",
    "compute.sslCertificates.list",
    "compute.sslPolicies.list",
    "compute.snapshots.list",
    "compute.targetHttpsProxies.list",
    "storage.buckets.list",
    "storage.buckets.getIamPolicy",
    "bigquery.datasets.get",
    "cloudkms.keyRings.getIamPolicy",
    "compute.networks.list",
    "dns.policies.list",
    "appengine.applications.get",
    "pubsub.topics.list",
    "cloudkms.cryptoKeys.list",
    "bigquery.tables.list",
    "bigtable.instances.list",
    "compute.images.list",
    "compute.instanceTemplates.list",
    "logging.logMetrics.list",
    "resourcemanager.projects.get",
    "cloudfunctions.functions.list",
    "spanner.instances.getIamPolicy",
    "spanner.instances.list",
    "spanner.backups.list",
    "spanner.backups.getIamPolicy",
    "spanner.databases.list",
    "spanner.databases.getIamPolicy",
    "cloudfunctions.functions.getIamPolicy",
    "pubsub.subscriptions.list",
    "spanner.backups.list",
    "compute.securityPolicies.list",
    "compute.regions.list",
    "dataproc.clusters.list",
    "run.revisions.list",
    "run.services.list",
    "compute.images.getIamPolicy",
    "accessapproval.settings.get",
    "accessapproval.requests.get",
    "serviceusage.services.list",
    "secretmanager.secrets.list",
    "compute.instanceGroupManagers.list",
    "redis.instances.list",
    "artifactregistry.repositories.list",
    "osconfig.patchDeployments.list",
    "compute.networks.getEffectiveFirewalls",

  ]
}
