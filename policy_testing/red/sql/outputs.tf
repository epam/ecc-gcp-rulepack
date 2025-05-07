output "sql" {
  value = {
    # postgresql
    sql-instance = google_sql_database_instance.this.self_link
    # mysql
    ecc-gcp-144-sql_instance_binary_logs                         = google_sql_database_instance.mysql.self_link
    ecc-gcp-176-local_infile_flag_for_mysql_instance_set_to_off  = google_sql_database_instance.mysql.self_link
    ecc-gcp-198-skip_show_database_database_flag_for_mysql       = google_sql_database_instance.mysql.self_link
    ecc-gcp-236-mysql_use_the_latest_major_version               = google_sql_database_instance.mysql.self_link
    ecc-gcp-240-slow_query_log_database_flag_for_cloud_sql_mysql = google_sql_database_instance.mysql.self_link
    ecc-gcp-400-password_history_flag_configured_for_mysql       = google_sql_database_instance.mysql.self_link
    ecc-gcp-401-password_reuse_interval_database_flag_for_mysql  = google_sql_database_instance.mysql.self_link
    # sqlserver
    ecc-gcp-184-cross_db_ownership_chaining_flag_sqlserver_is_off = google_sql_database_instance.sql.self_link
    ecc-gcp-185-contained_database_authentication_flag_sql_is_off = google_sql_database_instance.sql.self_link
    ecc-gcp-208-external_scripts_enabled_database_flag_for_sql    = google_sql_database_instance.sql.self_link
    ecc-gcp-209-user-connections-database-flag-for-sql-server     = google_sql_database_instance.sql.self_link
    ecc-gcp-210-user-options-database-flag-for-sql-server         = google_sql_database_instance.sql.self_link
    ecc-gcp-211-remote-access-database-flag-for-sql-server        = google_sql_database_instance.sql.self_link
    ecc-gcp-212-3625-database-flag-for-sql-server                 = google_sql_database_instance.sql.self_link
    # user
    ecc-gcp-046-mysql_database_no_root_login = google_sql_user.root_user.instance
    ecc-gcp-077-no_admin_name_for_google_sql = google_sql_user.admin_user.instance
  }
}