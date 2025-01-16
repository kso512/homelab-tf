# homelab-tf

Modular Terraform to manage Docker containers for a homelab environment using Git and local/on-premises hardware.

## Overview

Each subfolder under `hosts` represents a separate physical or virtual host machine upon which one or more Docker containers should be run.

Each subfolder under `modules` represents a separate Docker container to be run on one or more of the hosts above.

The defaults specified in the `variables.tf` of each module reflect the examples in documentation, and should be customized with a `variables.tf` within the subfolder under `hosts`.

To keep secrets out of the repo, we're using `hosts/*/variables.tf` in `.gitignore`.  The contents of these host-specific `variables.tf` files can be stored in a vault or password manager.  An example (`variables.tf.example`) has been provided with reasonable defaults, so feel free to start with that as a template.

## Requirements

* [Docker >= 20.10.5+dfsg1](https://docs.docker.com/engine/install/)
* [Git >= 2.30.3](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [Terraform >= v1.4.6](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

Optional:

* [ZFS](https://openzfs.org/wiki/Main_Page)

## Preparation

If using ZFS, build a filesystem to mount volumes within; for example:

    sudo zfs create -p -o "atime=off" -o "devices=off" \
    -o "compression=zstd" -o "xattr=sa" -o "dnodesize=auto" \
    -o "mountpoint=/srv/docker/swag" pool/swag

After adding a module, or in a fresh repo, remember to run `terraform init` to build parts of the backend such as the terraform lock, state, and backup state files.

Configure crontab to apply `terraform` at boot; for example:

    # Terraform
    @reboot cd /git/projects/kso512/homelab-tf/hosts/00001 ; terraform apply -auto-approve -no-color -compact-warnings&

## References

### Provisioner

* Docker provisioner for Terraform
  * [kreuzwerker/docker](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container)
  * [docker_container / Nested Schema for upload](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container#nestedblock--upload)

### Modules

* [Dashy](https://github.com/Lissy93/dashy)
  * Source: [lissy93/dashy](https://hub.docker.com/r/lissy93/dashy)
* [Digikam](https://www.digikam.org/)
  * Source: [linuxserver/digikam](https://hub.docker.com/r/linuxserver/digikam/#!)
* [Dokuwiki](https://www.dokuwiki.org/dokuwiki/)
  * Source: [linuxserver/dokuwiki](https://hub.docker.com/r/linuxserver/dokuwiki/#!)
* [Duplicati](https://duplicati.com/)
  * Source: [linuxserver/duplicati](https://hub.docker.com/r/linuxserver/duplicati/#!)
* [FreshRSS](https://freshrss.org/)
  * Source: [linuxserver/freshrss](https://hub.docker.com/r/linuxserver/freshrss/#!)
* [Grafana](https://grafana.com/docs/grafana/latest/setup-grafana/configure-docker/)
  * Source: [grafana/grafana-oss](https://hub.docker.com/r/grafana/grafana-oss/#!)
  * Depends on PostgreSQL
* [Grocy](https://grocy.info/)
  * Source: [linuxserver/grocy](https://hub.docker.com/r/linuxserver/grocy)
* [Home Assistant](https://www.home-assistant.io/installation/linux#platform-installation)
  * Source: [home-assistant/core](https://github.com/home-assistant/core/pkgs/container/home-assistant)
* [Nextcloud](https://docs.nextcloud.com/)
  * Source: [linuxserver/nextcloud](https://hub.docker.com/r/linuxserver/nextcloud)
  * Depends on PostgreSQL indirectly; manual installation steps preclude building everything here in the same way that the Grafana module does.
  * Depends on Swag
* [OpenVPN](https://openvpn.net/community-resources/)
  * Source: [openvpn/openvpn-as](https://hub.docker.com/r/openvpn/openvpn-as)
* [pihole](https://pi-hole.net/)
  * Source: [pihole/pihole](https://hub.docker.com/r/pihole/pihole)
* [PostgreSQL](https://www.postgresql.org/)
  * Source: [postgres](https://hub.docker.com/_/postgres)
* [Swag](https://docs.linuxserver.io/general/swag/)
  * Source: [linuxserver/docker-swag](https://hub.docker.com/r/linuxserver/swag)
  * [Nextcloud subdomain reverse proxy example](https://docs.linuxserver.io/general/swag/#nextcloud-subdomain-reverse-proxy-example)
