output "scaling_group_id" {
  description = "The Scaling Group ID"
  value       = concat(alicloud_ess_scaling_group.scaling_group.*.id, [""])[0]
}

output "balancer_id" {
  description = "The Load Balancer ID"
  value       = concat(alicloud_slb_load_balancer.balancer.*.id, [""])[0]
}

output "listener_id" {
  description = "The Listener ID"
  value       = concat(alicloud_slb_listener.listener.*.id, [""])[0]
}


