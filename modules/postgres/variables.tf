variable "container_name" {
    type    = string
    default = "some-postgres"
}

variable "data_host_path" {
    type    = string
    default = "/my/own/datadir"
}

variable "external_port" {
    type    = number
    default = 5432
}

variable "postgres_db" {
    type    = string
    default = "postgres"
}

variable "postgres_password" {
    sensitive = true
    type      = string
    default   = "mysecretpassword"
}

variable "postgres_user" {
    type    = string
    default = "postgres"
}

variable "postgres_version" {
    type    = string
    default = "latest"
}
