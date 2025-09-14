variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "db_flags_mysql" {
  type = map(string)
}

variable "db_flags_sql" {
  type = map(string)
}

variable "db_flags_postgresql" {
  type = map(string)
}