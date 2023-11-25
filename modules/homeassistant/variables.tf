variable "config_host_path" {
    type    = string
    default = "/PATH_TO_YOUR_CONFIG"
}

variable "container_name" {
    type = string
    default = "homeassistant"
}

variable "device_tracker_01_host" {
    sensitive = true
    type = string
    default = "tracker_01_host"
}

variable "device_tracker_01_username" {
    sensitive = true
    type = string
    default = "tracker_01_username"
}

variable "device_tracker_01_password" {
    sensitive = true
    type = string
    default = "tracker_01_password"
}

variable "device_tracker_02_host" {
    sensitive = true
    type = string
    default = "tracker_02_host"
}

variable "device_tracker_02_username" {
    sensitive = true
    type = string
    default = "tracker_02_username"
}

variable "device_tracker_02_password" {
    sensitive = true
    type = string
    default = "tracker_02_password"
}

variable "media_player_host" {
    sensitive = true
    type = string
    default = "MPD_HOST"
}

variable "external_port" {
    type = number
    default = "8123"
}

variable "homeassistant_version" {
    type = string
    default = "latest"
}

variable "timezone" {
    sensitive = true
    type = string
    default = "America/Los_Angeles"
}
