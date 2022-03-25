locals {
  balancer_id = var.balancer_id != "" ? var.balancer_id : concat(alicloud_slb_load_balancer.balancer.*.id, [""])[0]
}

resource "alicloud_ess_scaling_group" "scaling_group" {
  count                                    = var.create_scaling_group ? 1 : 0
  min_size                                 = var.min_size
  max_size                                 = var.max_size
  desired_capacity                         = var.desired_capacity
  scaling_group_name                       = var.scaling_group_name
  default_cooldown                         = var.default_cooldown
  vswitch_ids                              = var.vswitch_ids
  removal_policies                         = var.removal_policies
  db_instance_ids                          = var.db_instance_ids
  loadbalancer_ids                         = [local.balancer_id]
  multi_az_policy                          = var.multi_az_policy
  on_demand_base_capacity                  = var.on_demand_base_capacity
  on_demand_percentage_above_base_capacity = var.on_demand_percentage_above_base_capacity
  spot_instance_pools                      = var.spot_instance_pools
  spot_instance_remedy                     = var.spot_instance_remedy
  group_deletion_protection                = var.group_deletion_protection
  launch_template_id                       = var.launch_template_id
  launch_template_version                  = var.launch_template_version
}


resource "alicloud_slb_load_balancer" "balancer" {
  count                          = var.create_slb_balancer ? 1 : 0
  address                        = var.address
  address_ip_version             = var.address_ip_version
  address_type                   = var.address_type
  bandwidth                      = var.bandwidth
  delete_protection              = var.delete_protection
  internet_charge_type           = var.internet_charge_type
  load_balancer_name             = var.load_balancer_name
  load_balancer_spec             = var.load_balancer_spec
  master_zone_id                 = var.master_zone_id
  modification_protection_reason = var.modification_protection_reason
  modification_protection_status = var.modification_protection_status
  period                         = var.period
  payment_type                   = var.payment_type
  resource_group_id              = var.resource_group_id
  slave_zone_id                  = var.slave_zone_id
  vswitch_id                     = var.vswitch_ids[0]
}


resource "alicloud_slb_listener" "listener" {
  count                        = var.create_slb_listener ? 1 : 0
  load_balancer_id             = local.balancer_id
  description                  = var.description
  frontend_port                = var.frontend_port
  backend_port                 = var.backend_port
  protocol                     = var.protocol
  bandwidth                    = var.bandwidth
  scheduler                    = var.scheduler
  server_group_id              = var.server_group_id
  master_slave_server_group_id = var.master_slave_server_group_id
  acl_status                   = var.acl_status
  acl_type                     = var.acl_type
  acl_id                       = var.acl_id
  sticky_session               = var.sticky_session
  sticky_session_type          = var.sticky_session_type
  cookie_timeout               = var.cookie_timeout
  cookie                       = var.cookie
  persistence_timeout          = var.persistence_timeout
  health_check                 = var.health_check
  health_check_method          = var.health_check_method
  health_check_type            = var.health_check_type
  health_check_domain          = var.health_check_domain
  health_check_uri             = var.health_check_uri
  health_check_connect_port    = var.health_check_connect_port
  healthy_threshold            = var.healthy_threshold
  unhealthy_threshold          = var.unhealthy_threshold
  health_check_timeout         = var.health_check_timeout
  health_check_interval        = var.health_check_interval
  delete_protection_validation = var.delete_protection_validation
}