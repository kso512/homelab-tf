variable "config_host_path" {
    type    = string
    default = "/path/to/data/config"
}

variable "container_name" {
    type    = string
    default = "freshrss"
}

variable "freshrss_version" {
    type    = string
    default = "latest"
}

variable "external_port" {
    type    = number
    default = "80"
}

variable "pgid" {
    type    = number
    default = "1000"
}

variable "puid" {
    type    = number
    default = "1000"
}

variable "timezone" {
    sensitive = true
    type      = string
    default   = "Etc/UTC"
}
