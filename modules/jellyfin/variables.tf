variable "cache_host_path" {
    type    = string
    default = "/path/to/cache"
}

variable "config_host_path" {
    type    = string
    default = "/path/to/cache"
}

variable "container_name" {
    type    = string
    default = "jellyfin"
}

variable "external_port" {
    type    = number
    default = 8096
}

variable "media1_container_path" {
    type    = string
    default = "/path/to/media1"
}

variable "media1_host_path" {
    type    = string
    default = "/media1"
}

variable "media2_container_path" {
    type    = string
    default = "/path/to/media2"
}

variable "media2_host_path" {
    type    = string
    default = "/media2"
}

variable "jellyfin_version" {
    type    = string
    default = "latest"
}
