variable "admin_external_port" {
    type    = number
    default = "943"
}

variable "config_host_path" {
    type    = string
    default = "/path/to/data"
}

variable "container_name" {
    type    = string
    default = "openvpn-as"
}

variable "openvpn_version" {
    type    = string
    default = "latest"
}

variable "tcp_external_port" {
    type    = number
    default = "443"
}

variable "tun_host_path" {
    type    = string
    default = "/dev/net/tun"
}

variable "udp_external_port" {
    type    = number
    default = "1194"
}
