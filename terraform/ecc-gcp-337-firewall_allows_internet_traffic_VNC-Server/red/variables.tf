variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "firewall_name" {
  type = string
}

variable "port" {
  type = list(any)
}

variable "network" {
  type = string
}
