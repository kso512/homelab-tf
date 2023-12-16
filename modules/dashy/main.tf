terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_image" "dashy" {
  name         = "lissy93/dashy:${var.dashy_version}"
  keep_locally = false
}

resource "docker_container" "dashy" {
  image = docker_image.dashy.image_id
  name  = "${var.container_name}"
  ports {
    internal = 80
    external = "${var.external_port}"
    protocol = "tcp"
  }
  restart = "unless-stopped"
  volumes {
    container_path = "/app/public"
    host_path      = "${var.config_host_path}"
  }
  upload {
    file    = "/app/public/conf.yml"
    content = templatefile("${path.module}/templates/conf.yml.tftpl", {
      apikey      = var.apikey,
      city        = var.city,
      description = var.description,
      theme       = var.theme,
      title       = var.title,
      units       = var.units,
      })
  }
}
