module "digikam" {
    source           = "../../modules/digikam"
    config_host_path = var.digikam_config_host_path
    container_name   = var.digikam_container_name
    digikam_version  = var.digikam_version
    external_port    = var.digikam_external_port
    import_host_path = var.digikam_import_host_path
    pgid             = var.digikam_pgid
    puid             = var.digikam_puid
    timezone         = var.timezone
}

module "pihole" {
    source            = "../../modules/pihole"
    config_host_path  = var.pihole_config_host_path
    container_name    = var.pihole_container_name
    custom_line_00001 = var.pihole_custom_line_00001
    dns_1             = var.pihole_dns_1
    dns_2             = var.pihole_dns_2
    dns_3             = var.pihole_dns_3
    dns_4             = var.pihole_dns_4
    dnsmasq_host_path = var.pihole_dnsmasq_host_path
    external_port_dns = var.pihole_external_port_dns
    external_port_web = var.pihole_external_port_web
    pihole_version    = var.pihole_version
    rev_server_cidr   = var.pihole_rev_server_cidr
    rev_server_domain = var.pihole_rev_server_domain
    rev_server_target = var.pihole_rev_server_target
    timezone          = var.timezone
    webpassword       = var.pihole_webpassword
}
