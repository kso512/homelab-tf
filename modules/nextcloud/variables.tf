variable "config_host_path" {
    type    = string
    default = "/path/to/appdata"
}

variable "data_host_path" {
    type    = string
    default = "/path/to/data"
}

variable "container_name" {
    type    = string
    default = "nextcloud"
}

variable "external_port" {
    type    = number
    default = "443"
}

variable "nextcloud_version" {
    type    = string
    default = "latest"
}

variable "nfs_host_path" {
    type    = string
    default = "/path/to/nfs"
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
