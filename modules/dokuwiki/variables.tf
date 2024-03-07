variable "config_host_path" {
    type    = string
    default = "/path/to/appdata/config"
}

variable "container_name" {
    type    = string
    default = "dokuwiki"
}

variable "dokuwiki_version" {
    type    = string
    default = "latest"
}

variable "external_port" {
    type    = number
    default = "443"
}

variable "pgid" {
    type    = number
    default = "1000"
}

variable "puid" {
    type    = number
    default = "1000"
}

variable "template" {
    type    = string
    default = "dokuwiki"
}

variable "timezone" {
    sensitive = true
    type      = string
    default   = "Etc/UTC"
}

variable "title" {
    type    = string
    default = "Dokuwiki"
}
