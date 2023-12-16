terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_image" "duplicati" {
  name         = "lscr.io/linuxserver/duplicati:${var.duplicati_version}"
  keep_locally = false
}

resource "docker_container" "duplicati" {
  env = [
    "CLI_ARGS=${var.cli_args}",
    "PUID=${var.puid}",
    "PGID=${var.pgid}",
    "TZ=${var.timezone}",
  ]
  image = docker_image.duplicati.image_id
  name  = "${var.container_name}"
  ports {
    internal = 8200
    external = "${var.external_port}"
    protocol = "tcp"
  }
  restart = "unless-stopped"
  volumes {
    container_path = "/backups"
    host_path      = "${var.backups_host_path}"
  }
  volumes {
    container_path = "/config"
    host_path      = "${var.config_host_path}"
  }
  volumes {
    container_path = "/source"
    host_path      = "${var.source_host_path}"
  }
}
