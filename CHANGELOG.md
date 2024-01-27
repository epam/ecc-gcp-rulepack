# Changelog

## [v3.0] - 2024-01-27
### :sparkles: New Policies
- [`3e048fe`](https://github.com/epam/ecc-gcp-rulepack/commit/3e048fecd1ff7b6d4acc20989bc7c28ddf2c7f6f) - added policy ecc-gcp-442-suspended_instances_for_more_than_a_week
- [`ef784b6`](https://github.com/epam/ecc-gcp-rulepack/commit/ef784b6d8ffd18979f46f21580f6b9fc443007af) - added policy ecc-gcp-443-enabled_kms_primary_key_version
- [`8a13e47`](https://github.com/epam/ecc-gcp-rulepack/commit/8a13e47be138e43afeddb1835fac6d3cd30d6b7c) - added policy  ecc-gcp-447-attached_disk
- [`5bab2e6`](https://github.com/epam/ecc-gcp-rulepack/commit/5bab2e606d193bc581ba9baee039238dcca88366) - added policy ecc-gcp-446-compute_instance_template_label_info
- [`34e825e`](https://github.com/epam/ecc-gcp-rulepack/commit/34e825ec808192d2501719b856b56f84d521deec) - added policy ecc-gcp-449-compute_snapshot_label_info
- [`6492e54`](https://github.com/epam/ecc-gcp-rulepack/commit/6492e549100fba83b8ba3ebc84090f87dc73d525) - added policy ecc-gcp-448-preemptible_vm
- [`b62f0fc`](https://github.com/epam/ecc-gcp-rulepack/commit/b62f0fc347ea56e93c321e77721a78bc068fb457) - added policy ecc-gcp-450-preemptible_gke_vm
- [`7c7a9b8`](https://github.com/epam/ecc-gcp-rulepack/commit/7c7a9b829e3a7abf5371fbaba5590b578d2af1c0) - added policy ecc-gcp-451-compute_disk_label_info
- [`f274f0d`](https://github.com/epam/ecc-gcp-rulepack/commit/f274f0d91ceeb1a5b605d0fc4d0db03074dac9a5) - added policy ecc-gcp-387-instance_groups_have_autoscale_enabled
- [`97c89f0`](https://github.com/epam/ecc-gcp-rulepack/commit/97c89f0dcb806f5aa822f213029de1c5f5d48441) - added policy ecc-gcp-293-spanner_backup_expiration_time_30_days_or_more
- [`9249b17`](https://github.com/epam/ecc-gcp-rulepack/commit/9249b17e30b7c89bb3d8acbeb3d63f41742ddd73) - added policy ecc-gcp-452-dataproc_cluster_label_info
- [`1035466`](https://github.com/epam/ecc-gcp-rulepack/commit/1035466f418b93671d8ee3c98a62415927c073e3) - added policy ecc-gcp-453-redis_instance_label_info
- [`4277f93`](https://github.com/epam/ecc-gcp-rulepack/commit/4277f9323576b5efb56d728d236f419a682ddcef) - added policy ecc-gcp-231-instance_configured_with_autohealing
- [`f913fbd`](https://github.com/epam/ecc-gcp-rulepack/commit/f913fbd8cfdb929f7f7f8f777401444f909c7175) - added policy ecc-gcp-233-vm_images_not_publicly_shared
- [`05ce6ec`](https://github.com/epam/ecc-gcp-rulepack/commit/05ce6ec7cbb902e190e39b619c442a5da7d29747) - added policy ecc-gcp-242-cloud_functions_restrict_public_access
- [`8181e9e`](https://github.com/epam/ecc-gcp-rulepack/commit/8181e9e503fe0ceb0f4536deb7c79f83910d0b82) - added policy ecc-gcp-455-bigquery_dataset_label_info
- [`ac8cfbb`](https://github.com/epam/ecc-gcp-rulepack/commit/ac8cfbb6dabe23bc83845e42c13bd0ca1dc23a52) - added policy ecc-gcp-457-bigquery_table_label_info
- [`c6731b9`](https://github.com/epam/ecc-gcp-rulepack/commit/c6731b93040fd144870ffab077018a9b3603e7ca) - added policy ecc-gcp-040-cloud_storage_not_publicly_accessible
- [`2700b2e`](https://github.com/epam/ecc-gcp-rulepack/commit/2700b2e4ad3cea7829d6b982ab7af4258fbebbc2) - added policy ecc-gcp-456-bigquery_job_label_info
- [`3bc933b`](https://github.com/epam/ecc-gcp-rulepack/commit/3bc933b4691edcfd7e6f1199437d6b1c528197fa) - added policy ecc-gcp-473-configured_automatic_storage_increase_limit

### :wrench: Updates
- [`7d5fb1b`](https://github.com/epam/ecc-gcp-rulepack/commit/7d5fb1b7d0bfddb0c6c80bbba20c66cd4c13b5c1) - added 'comment'(id) field to all rules which corresponds to metadata sections
- [`092268e`](https://github.com/epam/ecc-gcp-rulepack/commit/092268ed42514e2de47f74c78077f338a685e398) - added permissions to the iam terraform template
- [`e2505af`](https://github.com/epam/ecc-gcp-rulepack/commit/e2505af08ba2a9d40ddbc1f713732903443c6581) - updated comment field for all policies
- [`5e92016`](https://github.com/epam/ecc-gcp-rulepack/commit/5e92016d8f9f7734d070e7ebca061c6019c06469) - updated tests for policies 261, 309

### :adhesive_bandage: Test Fixes
- [`ab2e43a`](https://github.com/epam/ecc-gcp-rulepack/commit/ab2e43a484735ee6e3470c9d4ef558fa426a303b) - fixed test for policy 452
- [`09a2174`](https://github.com/epam/ecc-gcp-rulepack/commit/09a2174d33aae8a80822d7566e0c69d45db92f38) - fixed tests for policies 261, 309, 452


## [v2.0] - 2023-07-28
### :sparkles: New Policies
- [`3232ca4`](https://github.com/epam/ecc-gcp-rulepack/commit/3232ca49aea5a76b13d62ba56ae1335e03a64e76) - added policy ecc-gcp-261-dataproc_clusters_encrypted_with_cmek
- [`d24f572`](https://github.com/epam/ecc-gcp-rulepack/commit/d24f572294067db5eaa770e4ca958f8468185825) - added policy ecc-gcp-309-dataproc-cluster-does-not-have-a-public-ip
- [`6471490`](https://github.com/epam/ecc-gcp-rulepack/commit/6471490020c1cf1129579140f171f32ecc170e22) - added policy ecc-gcp-311-datafusion-stackdriver-logging
- [`61d9d97`](https://github.com/epam/ecc-gcp-rulepack/commit/61d9d974750539037b07a5b61a6158e6c7ab38f9) - added policy ecc-gcp-312-datafusion-stackdriver-monitoring
- [`f67a70e`](https://github.com/epam/ecc-gcp-rulepack/commit/f67a70e5cf94bf4a50681c1db0fa4d840687c5d2) - added policy ecc-gcp-409-os-patch-deployment-configured-with-recurring-schedule
- [`3736b30`](https://github.com/epam/ecc-gcp-rulepack/commit/3736b30400fb16c8c3b6bd4d6cd10db38aca87a1) - added policy ecc-gcp-412-data-fusion-instance-has-public-ip
- [`650f11a`](https://github.com/epam/ecc-gcp-rulepack/commit/650f11af84ded769054dc5509eee69f0626d01e9) - added policy ecc-gcp-432-cluster_with_private_endpoint_enabled_and_public_access_disabled
- [`c857cc6`](https://github.com/epam/ecc-gcp-rulepack/commit/c857cc6bb6c8fcedb90494d09f9495cd443fd937) - added policy ecc-gcp-434-cmek_for_gke_persistent_disks

### :adhesive_bandage: Test Fixes
- [`fa97400`](https://github.com/epam/ecc-gcp-rulepack/commit/fa97400962dbc4c2bcfe17fd817171a33405caae) - fixed tests for policies 261, 309

### :open_file_folder: Other Changes
- [`e5a5f8f`](https://github.com/epam/ecc-gcp-rulepack/commit/e5a5f8f24ae2c106be16e63edb20d3eef8a46d91) - Added non-compatible policies and terraforms
- [`04c62f0`](https://github.com/epam/ecc-gcp-rulepack/commit/04c62f0f6197ac75c857ae3e34c425e4809db7f1) - Added least privilege iam files


## [v1.0] - 2023-07-11
### :open_file_folder: Initial version


[v1.0]: https://github.com/epam/ecc-gcp-rulepack/compare/Init...v1.0

[v2.0]: https://github.com/epam/ecc-gcp-rulepack/compare/v1.0...v2.0

[v3.0]: https://github.com/epam/ecc-gcp-rulepack/compare/v2.0...v3.0