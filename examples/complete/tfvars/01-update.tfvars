# alicloud_ess_scaling_group
min_size           = 2
max_size           = 5
scaling_group_name = "scaling_group_name_update"
removal_policies   = ["NewestInstance"]
default_cooldown   = 21


# alicloud_slb_load_balancer
load_balancer_name = "load_balancer_name_update"
delete_protection  = "off"
load_balancer_spec = "slb.s2.medium"

# alicloud_slb_listener
bandwidth             = 11
health_check          = "off"
health_check_type     = "http"
health_check_interval = 5
health_check_timeout  = 10
healthy_threshold     = 5