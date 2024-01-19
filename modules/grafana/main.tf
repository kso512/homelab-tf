terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_image" "grafana" {
  name         = "grafana/grafana-oss:${var.grafana_version}"
  keep_locally = false
}

resource "docker_container" "grafana" {
  image = docker_image.grafana.image_id
  name  = "${var.container_name}"
  env   = [
    "GF_PATHS_CONFIG=${var.ini_file}",
    "GF_LOG_MODE=${var.log_mode}",
  ]
  ports {
    internal = 3000
    external = "${var.external_port}"
    protocol = "tcp"
  }
  volumes {
    container_path = "/var/lib/grafana"
    host_path      = "${var.config_host_path}"
  }
  upload {
    file    = "/var/lib/grafana/grafana.ini"
    content = templatefile("${path.module}/templates/grafana.ini.tftpl", {
      postgres_host     = var.postgres_host,
      postgres_name     = var.postgres_name,
      postgres_password = var.postgres_password,
      postgres_user     = var.postgres_user,
      })
  }
}
