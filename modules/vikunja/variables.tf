variable "config_host_path" {
    type    = string
    default = "./files"
}

variable "container_name" {
    type    = string
    default = "vikunja"
}

variable "database_database" {
    type    = string
    default = "vikunja"
}

variable "database_host" {
    type    = string
    default = "db"
}

variable "database_password" {
    sensitive = true
    type      = string
    default   = "changeme"
}

variable "database_type" {
    type    = string
    default = "mysql"
}

variable "database_user" {
    sensitive = true
    type      = string
    default   = "vikunja"
}

variable "external_port" {
    type    = number
    default = "3456"
}

variable "service_jwtsecret" {
    sensitive = true
    type      = string
    default   = "<a super secure random secret>"
}

variable "service_publicurl" {
    type    = string
    default = "http://<the public url where Vikunja is reachable>"
}

variable "vikunja_version" {
    type    = string
    default = "latest"
}
