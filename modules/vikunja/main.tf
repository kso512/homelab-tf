terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_image" "vikunja" {
  name         = "vikunja/vikunja:${var.vikunja_version}"
  keep_locally = false
}

resource "docker_container" "vikunja" {
  image   = docker_image.vikunja.image_id
  name    = "${var.container_name}"
  restart = "unless-stopped"
  env = [
    "VIKUNJA_SERVICE_PUBLICURL=${var.service_publicurl}",
    "VIKUNJA_DATABASE_HOST=${var.database_host}",
    "VIKUNJA_DATABASE_PASSWORD=${var.database_password}",
    "VIKUNJA_DATABASE_TYPE=${var.database_type}",
    "VIKUNJA_DATABASE_USER=${var.database_user}",
    "VIKUNJA_DATABASE_DATABASE=${var.database_database}",
    "VIKUNJA_SERVICE_JWTSECRET=${var.service_jwtsecret}",
  ]
  ports {
    internal = 3456
    external = "${var.external_port}"
    protocol = "tcp"
  }
  volumes {
    container_path = "/app/vikunja/files"
    host_path      = "${var.config_host_path}"
  }
}
