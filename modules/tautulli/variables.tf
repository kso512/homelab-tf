variable "config_host_path" {
    type    = string
    default = "/path/to/appdata/config"
}

variable "container_name" {
    type    = string
    default = "tautulli"
}

variable "tautulli_version" {
    type    = string
    default = "latest"
}

variable "external_port" {
    type    = number
    default = 8181
}

variable "pgid" {
    type    = number
    default = 1000
}

variable "puid" {
    type    = number
    default = 1000
}

variable "timezone" {
    sensitive = true
    type      = string
    default   = "Etc/UTC"
}
