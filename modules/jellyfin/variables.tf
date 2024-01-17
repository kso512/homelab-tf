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

variable "media_container_path" {
    type    = string
    default = "/path/to/media"
}

variable "media_host_path" {
    type    = string
    default = "/media"
}

variable "jellyfin_version" {
    type    = string
    default = "latest"
}
