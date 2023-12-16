variable "config_host_path" {
    type    = string
    default = "/path/to/data"
}

variable "container_name" {
    type    = string
    default = "sickgear"
}

variable "downloads_host_path" {
    type    = string
    default = "/path/to/data"
}

variable "external_port" {
    type    = number
    default = 8081
}

variable "pgid" {
    type    = number
    default = 1000
}

variable "puid" {
    type    = number
    default = 1000
}

variable "sickgear_version" {
    type    = string
    default = "latest"
}

variable "timezone" {
    sensitive = true
    type      = string
    default   = "Etc/UTC"
}

variable "tv_host_path" {
    type    = string
    default = "/path/to/data"
}
