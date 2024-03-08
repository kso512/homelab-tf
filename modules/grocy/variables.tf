variable "config_host_path" {
    type    = string
    default = "/path/to/grocy/config"
}

variable "container_name" {
    type    = string
    default = "grocy"
}

variable "external_port" {
    type    = number
    default = "9283"
}

variable "grocy_version" {
    type    = string
    default = "latest"
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
