terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_image" "homeassistant" {
  name         = "ghcr.io/home-assistant/home-assistant:${var.homeassistant_version}"
  keep_locally = false
}

resource "docker_container" "homeassistant" {
  env = [
    "TZ=${var.timezone}",
  ]
  image = docker_image.homeassistant.image_id
  name  = "homeassistant"
  ports {
    internal = 8123
    external = "${var.external_port}"
    protocol = "tcp"
  }
  restart = "unless-stopped"
  volumes {
    container_path = "/config"
    host_path      = "${var.config_host_path}"
  }
  volumes {
    container_path = "/run/dbus"
    host_path      = "/run/dbus"
    read_only      = true
  }
  upload {
    file    = "/config/configuration.yaml"
    content = templatefile("${path.module}/templates/configuration.yaml.tftpl", {
      timezone                   = var.timezone,
      device_tracker_01_host     = var.device_tracker_01_host,
      device_tracker_01_username = var.device_tracker_01_username,
      device_tracker_01_password = var.device_tracker_01_password,
      device_tracker_02_host     = var.device_tracker_02_host,
      device_tracker_02_username = var.device_tracker_02_username,
      device_tracker_02_password = var.device_tracker_02_password,
      media_player_host          = var.media_player_host,
      })
  }
}
