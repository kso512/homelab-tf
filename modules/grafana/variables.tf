variable "config_host_path" {
    type    = string
    default = "grafana_storage"
}

variable "container_name" {
    type    = string
    default = "grafana"
}

variable "external_port" {
    type    = number
    default = "3000"
}

variable "grafana_version" {
    type    = string
    default = "latest"
}

variable "ini_file" {
    type    = string
    default = "/etc/grafana/grafana.ini"
}

variable "log_mode" {
    type    = string
    default = "console file"
}

variable "postgres_host" {
    type    = string
    default = "postgres"
}

variable "postgres_password" {
    type    = string
    default = "Hunter7"
}
