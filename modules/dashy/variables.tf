variable "apikey" {
    sensitive = true
    type      = string
    default   = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}

variable "city" {
    sensitive = true
    type      = string
    default   = "London"
}

variable "config_host_path" {
    type    = string
    default = "/root"
}

variable "container_name" {
    type    = string
    default = "my-dashboard"
}

variable "dashy_version" {
    type    = string
    default = "latest"
}

variable "description" {
    type    = string
    default = "Welcome to your new dashboard!"
}

variable "external_port" {
    type    = number
    default = 8080
}

variable "theme" {
    type    = string
    default = "colorful"
}

variable "title" {
    type    = string
    default = "Dashy"
}

variable "units" {
    type    = string
    default = "metric"
}
