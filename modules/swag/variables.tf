variable "config_host_path" {
    type    = string
    default = "/home/aptalca/appdata/swag"
}

variable "container_name" {
    type    = string
    default = "swag"
}

variable "dnsplugin" {
    type    = string
    default = "cloudflare"
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

variable "subdomains" {
    type    = string
    default = "wildcard"
}

variable "swag_version" {
    type    = string
    default = "latest"
}

variable "timezone" {
    sensitive = true
    type      = string
    default   = "Europe/London"
}

variable "upstream_app" {
    sensitive = true
    type      = string
}

variable "upstream_port" {
    type = number
}

variable "upstream_proto" {
    type = string
}

variable "url" {
    sensitive = true
    type      = string
    default   = "linuxserver-test.duckdns.org"
}

variable "validation" {
    type    = string
    default = "dns"
}
