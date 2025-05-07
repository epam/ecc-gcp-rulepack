db_flags_mysql = {
  "local_infile"       = "on"
  "skip_show_database" = "off"
  "slow_query_log"     = "off"
}

db_flags_sql = {
  # "cross db ownership chaining"       = "on" deprecated
  "contained database authentication" = "on"
  "external scripts enabled"          = "on"
  "user connections"                  = "1000"
  "user options"                      = "100"
  "remote access"                     = "on"
  "3625"                              = "off"
}
db_flags_postgresql = {
  "log_checkpoints"            = "off"
  "log_connections"            = "off"
  "log_disconnections"         = "off"
  "log_lock_waits"             = "off"
  "log_min_messages"           = "panic"
  "log_temp_files"             = "-1"
  "log_min_duration_statement" = "1"
  "log_error_verbosity"        = "terse"
  "log_duration"               = "off"
  "log_statement"              = "none"
  "log_hostname"               = "on"
  # "log_parser_stats"           = "on"
  # "log_planner_stats"          = "on"
  # "log_executor_stats"         = "on"
  "log_statement_stats"     = "on"
  "log_min_error_statement" = "info"
  "cloudsql.enable_pgaudit" = "off"
}