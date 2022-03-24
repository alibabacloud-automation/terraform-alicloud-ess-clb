data "alicloud_zones" "default" {
}

module "vpc" {
  source             = "alibaba/vpc/alicloud"
  create             = true
  vpc_cidr           = "172.16.0.0/16"
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = [data.alicloud_zones.default.zones.0.id]
}



module "ess-clb" {
  source = "../.."
  #  alicloud_ess_scaling_group
  create_scaling_group = true
  min_size             = var.min_size
  max_size             = var.max_size
  scaling_group_name   = var.scaling_group_name
  removal_policies     = var.removal_policies
  vswitch_ids          = module.vpc.this_vswitch_ids
  default_cooldown     = var.default_cooldown
  spot_instance_remedy = var.spot_instance_remedy

  #  alicloud_slb_load_balancer
  create_slb_balancer            = true
  load_balancer_name             = var.load_balancer_name
  load_balancer_spec             = var.load_balancer_spec
  address_ip_version             = "ipv4"
  payment_type                   = "PayAsYouGo"
  delete_protection              = var.delete_protection
  address_type                   = "internet"
  modification_protection_status = var.modification_protection_status
  internet_charge_type           = var.internet_charge_type

  #  alicloud_slb_listener
  create_slb_listener   = true
  backend_port          = 22
  frontend_port         = 2
  protocol              = "tcp"
  bandwidth             = var.bandwidth
  health_check          = var.health_check
  health_check_type     = var.health_check_type
  health_check_interval = var.health_check_interval
  health_check_method   = var.health_check_method
  health_check_timeout  = var.health_check_timeout
  healthy_threshold     = var.healthy_threshold
}