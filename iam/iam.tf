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
    "accessapproval.requests.get",
    "accessapproval.settings.get",
    "appengine.applications.get",
    "bigquery.datasets.get",
    "bigquery.jobs.list",
    "bigquery.tables.get",
    "bigquery.tables.list",
    "bigtable.backups.list",
    "bigtable.clusters.list",
    "bigtable.instances.list",
    "cloudfunctions.functions.getIamPolicy",
    "cloudfunctions.functions.list",
    "cloudkms.cryptoKeys.list",
    "cloudkms.keyRings.getIamPolicy",
    "cloudkms.keyRings.list",
    "cloudsql.instances.list",
    "cloudsql.users.list",
    "compute.backendServices.list",
    "compute.disks.list",
    "compute.firewalls.list",
    "compute.images.getIamPolicy",
    "compute.images.list",
    "compute.instanceGroupManagers.list",
    "compute.instanceTemplates.list",
    "compute.instances.list",
    "compute.networks.getEffectiveFirewalls",
    "compute.networks.list",
    "compute.projects.get",
    "compute.regions.list",
    "compute.securityPolicies.list",
    "compute.snapshots.list",
    "compute.sslCertificates.list",
    "compute.sslPolicies.list",
    "compute.subnetworks.list",
    "compute.targetHttpsProxies.list",
    "compute.zones.list",
    "container.clusters.get",
    "container.clusters.list",
    "dataflow.jobs.list",
    "datafusion.instances.list",
    "dataproc.clusters.list",
    "dns.managedZones.list",
    "dns.resourceRecordSets.get",	
    "dns.resourceRecordSets.list",
    "iam.serviceAccountKeys.list",
    "iam.serviceAccounts.list",
    "logging.logMetrics.get",
    "logging.logMetrics.list",
    "logging.sinks.list",
    "monitoring.alertPolicies.list",
    "notebooks.instances.list",
    "osconfig.patchDeployments.list",
    "pubsub.subscriptions.list",
    "pubsub.topics.list",
    "redis.instances.list",
    "resourcemanager.projects.get",
    "resourcemanager.projects.getIamPolicy",
    "run.revisions.list",
    "run.services.list",
    "secretmanager.secrets.list",
    "serviceusage.apiKeys.list",
    "serviceusage.services.list",
    "spanner.backups.getIamPolicy",
    "spanner.backups.list",
    "spanner.databases.getIamPolicy",
    "spanner.databases.list",
    "spanner.instances.getIamPolicy",
    "spanner.instances.list",
    "storage.buckets.getIamPolicy",
    "storage.buckets.list",
  ]
}
