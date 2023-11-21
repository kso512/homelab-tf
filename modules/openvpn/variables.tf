variable "config_host_path" {
    type    = string
    default = "ovpn-data-example"
}

variable "container_name" {
    type    = string
    default = "openvpn"
}

variable "dns_ip" {
    type    = string
    default = "192.168.0.1"
}

variable "external_port" {
    type    = number
    default = "1194"
}

variable "openvpn_version" {
    type    = number
    default = "2.4"
}

variable "site_name" {
    type    = string
    default = "example.com"
}
