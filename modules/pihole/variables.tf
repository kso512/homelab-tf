variable "timezone" {
    sensitive = true
    type      = string
    default   = "America/Chicago"
}

variable "config_host_path" {
    type    = string
    default = "./etc-pihole"
}

variable "container_name" {
    type    = string
    default = "pihole"
}

variable "custom_line_00001" {
    type    = string
    default = "127.0.0.1 spam.example.com"
}

variable "dns_1" {
    type    = string
    default = "8.8.8.8"
}

variable "dns_2" {
    type    = string
    default = "2001:4860:4860:0:0:0:0:8888"
}

variable "dns_3" {
    type    = string
    default = "1.1.1.1"
}

variable "dns_4" {
    type    = string
    default = "2606:4700:4700::1111"
}

variable "dnsmasq_host_path" {
    type    = string
    default = "./etc-dnsmasq.d"
}

variable "external_port_dns" {
    type    = number
    default = "53"
}

variable "external_port_web" {
    type    = number
    default = "80"
}

variable "pihole_version" {
    type    = string
    default = "latest"
}

variable "rev_server_cidr" {
    type    = string
    default = "192.168.0.1/24"
}

variable "rev_server_domain" {
    type    = string
    default = "local"
}

variable "rev_server_target" {
    type    = string
    default = "192.168.0.1"
}

variable "webpassword" {
    sensitive = true
    type      = string
    default   = "123456"
}
