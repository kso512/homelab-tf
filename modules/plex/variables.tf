variable "config_host_path" {
    type    = string
    default = "/path/to/library"
}

variable "container_name" {
    type    = string
    default = "plex"
}

variable "external_port" {
    type = number
    default = 32400
}

variable "media_host_path" {
    type    = string
    default = "/path/to/media"
}

variable "pgid" {
    type = number
    default = 1000
}

variable "plex_version" {
    type    = string
    default = "latest"
}

variable "puid" {
    type = number
    default = 1000
}

variable "timezone" {
    sensitive = true
    type      = string
    default   = "Etc/UTC"
}
