# terraform-alicloud-ess-clb
Terraform Module for creating scaling service for classic load balancer on Alibaba Cloud.

These types of resources are supported:

* [alicloud_ess_scaling_group](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ess_scaling_group)
* [alicloud_slb_load_balancer](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/slb_load_balancer)
* [alicloud_slb_listener](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/slb_listener)

## Usage

Create a 
```hcl
module "example" {
  source               = "terraform-alicloud-modules/ess-clb/alicloud"
  min_size             = 1
  max_size             = 4
  desired_capacity     = 2
  default_cooldown     = 28
  scaling_group_name   = "your_name"
  vswitch_ids          = ["vswitch_ids"]
  spot_instance_remedy = false

  load_balancer_name             = "your_load_balancer_name"
  load_balancer_spec             = "your_load_balancer_spec"
  address_ip_version             = "ipv4"
  payment_type                   = "PayAsYouGo"
  delete_protection              = "off"
  address_type                   = "internet"
  modification_protection_status = "NonProtection"
  internet_charge_type           = "PayByTraffic"

  backend_port          = 22
  frontend_port         = 2
  protocol              = "tcp"
  bandwidth             = 10
  health_check          = "off"
  health_check_type     = "tcp"
  health_check_interval = 4
  health_check_method   = "get"
  health_check_timeout  = 5
  healthy_threshold     = 3
}
```

## Examples

* [complete example](https://github.com/terraform-alicloud-modules/terraform-alicloud-ess-clb/tree/main/examples/complete)

## Terraform versions

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.67.0 |

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)