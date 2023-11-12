# homelab-tf

Modular Terraform to manage Docker containers for a homelab environment using Git and local/on-premises hardware.

## Overview

Each subfolder under `hosts` represents a separate physical or virtual host machine upon which one or more Docker containers should be run.

Each subfolder under `modules` represents a separate Docker container to be run on one or more of the hosts above.

The defaults specified in the `variables.tf` of each module reflect the examples in documentation, and should be customized with a `variables.tf` within the subfolder under `hosts`.

To keep secrets out of the repo, we're using `hosts/*/variables.tf` in `.gitignore`.  The contents of these host-specific `variables.tf` files can be stored in a vault or password manager.  An example (`variables.tf.example`) has been provided with reasonable defaults, so feel free to start with that as a template.

## Container and Port Assignments

### Host: 00001

| TCP   | UDP  | Allocation | Host Variable Declaration |
|-------|------|------------|---------------------------|
| 443   | -    | swag       | `swag_external_port`      |
| 8888  | -    | nextcloud  | `nextcloud_external_port` |

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
    @reboot cd ~/git/projects/kso512/homelab-tf/hosts/00001 ; terraform apply -auto-approve -no-color -compact-warnings&

## References

### Provisioner

* Docker provisioner for Terraform
  * [kreuzwerker/docker](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container)
  * [docker_container / Nested Schema for upload](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container#nestedblock--upload)

### Modules

* [Nextcloud](https://docs.nextcloud.com/)
  * Source: [linuxserver/nextcloud](https://hub.docker.com/r/linuxserver/nextcloud)
  * Depends on Swag
* [Swag](https://docs.linuxserver.io/general/swag/)
  * Source: [linuxserver/docker-swag](https://hub.docker.com/r/linuxserver/swag)
  * [Nextcloud subdomain reverse proxy example](https://docs.linuxserver.io/general/swag/#nextcloud-subdomain-reverse-proxy-example)
