variable "backups_host_path" {
    type    = string
    default = "/path/to/backups"
}

variable "cli_args" {
    type    = string
    default = ""
}

variable "config_host_path" {
    type    = string
    default = "/path/to/appdata/config"
}

variable "container_name" {
    type    = string
    default = "duplicati"
}

variable "duplicati_version" {
    type    = string
    default = "latest"
}

variable "external_port" {
    type    = number
    default = "8200"
}

variable "pgid" {
    type    = number
    default = "1000"
}

variable "puid" {
    type    = number
    default = "1000"
}

variable "source_host_path" {
    type    = string
    default = "/path/to/source"
}

variable "timezone" {
    sensitive = true
    type      = string
    default   = "Etc/UTC"
}
