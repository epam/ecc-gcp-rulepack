db_flags_mysql = {
  "local_infile"            = "off"
  "skip_show_database"      = "on"
  "slow_query_log"          = "on"
  "password_history"        = "10"
  "password_reuse_interval" = "365"
}

db_flags_sql = {
  "contained database authentication" = "off"
  "external scripts enabled"          = "off"
  "remote access"                     = "off"
  "3625"                              = "on"
}
db_flags_postgresql = {
  "log_checkpoints"            = "on"
  "log_connections"            = "on"
  "log_disconnections"         = "on"
  "log_lock_waits"             = "on"
  "log_min_messages"           = "error"
  "log_temp_files"             = "0"
  "log_min_duration_statement" = "-1"
  "log_error_verbosity"        = "verbose"
  "log_duration"               = "on"
  "log_statement"              = "ddl"
  "log_hostname"               = "off"
  "log_statement_stats"        = "off"
  "log_min_error_statement"    = "log"
  "cloudsql.enable_pgaudit"    = "on"
}