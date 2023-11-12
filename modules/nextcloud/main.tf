terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_image" "nextcloud" {
  name         = "lscr.io/linuxserver/nextcloud:${var.nextcloud_version}"
  keep_locally = false
}

resource "docker_container" "nextcloud" {
  image   = docker_image.nextcloud.image_id
  name    = "${var.container_name}"
  restart = "unless-stopped"
  env = [
    "PUID=${var.puid}",
    "PGID=${var.pgid}",
    "TZ=${var.timezone}",
  ]
  ports {
    internal = 443
    external = "${var.external_port}"
    protocol = "tcp"
  }
  volumes {
    container_path = "/config"
    host_path    = "${var.config_host_path}"
  }
  volumes {
    container_path = "/data"
    host_path    = "${var.data_host_path}"
  }
  volumes {
    container_path = "/srv/nfs"
    host_path      = "${var.nfs_host_path}"
  }
}
