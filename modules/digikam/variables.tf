variable "config_host_path" {
    type    = string
    default = "/path/to/appdata/config"
}

variable "import_host_path" {
    type    = string
    default = "/path/to/import"
}

variable "container_name" {
    type    = string
    default = "digikam"
}

variable "digikam_version" {
    type    = string
    default = "latest"
}

variable "external_port" {
    type    = number
    default = "3001"
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
