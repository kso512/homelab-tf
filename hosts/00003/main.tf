module "homeassistant" {
    source                     = "../../modules/homeassistant"
    config_host_path           = var.homeassistant_config_host_path
    container_name             = var.homeassistant_container_name
    device_tracker_01_host     = var.homeassistant_device_tracker_01_host
    device_tracker_01_username = var.homeassistant_device_tracker_01_username
    device_tracker_01_password = var.homeassistant_device_tracker_01_password
    device_tracker_02_host     = var.homeassistant_device_tracker_02_host
    device_tracker_02_username = var.homeassistant_device_tracker_02_username
    device_tracker_02_password = var.homeassistant_device_tracker_02_password
    external_port              = var.homeassistant_external_port
    homeassistant_version      = var.homeassistant_version
    media_player_host          = var.homeassistant_media_player_host
    timezone                   = var.timezone
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
