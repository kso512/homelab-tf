terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_image" "jellyfin" {
  name         = "jellyfin/jellyfin:${var.jellyfin_version}"
  keep_locally = false
}

resource "docker_container" "jellyfin" {
  image = docker_image.jellyfin.image_id
  name  = "${var.container_name}"
  ports {
    internal = 8096
    external = "${var.external_port}"
    protocol = "tcp"
  }
  volumes {
    container_path = "/config"
    host_path      = "${var.config_host_path}"
  }
  volumes {
    container_path = "/cache"
    host_path      = "${var.cache_host_path}"
  }
  volumes {
    container_path = "${var.media1_container_path}"
    host_path      = "${var.media1_host_path}"
  }
  volumes {
    container_path = "${var.media2_container_path}"
    host_path      = "${var.media2_host_path}"
  }
}
