# terraform-alicloud-ess-clb
Terraform Module for creating scaling service for classic load balancer on Alibaba Cloud.

These types of resources are supported:

* [alicloud_ess_scaling_group](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ess_scaling_group)
* [alicloud_slb_load_balancer](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/slb_load_balancer)
* [alicloud_slb_listener](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/slb_listener)

## Usage

<div style="display: block;margin-bottom: 40px;"><div class="oics-button" style="float: right;position: absolute;margin-bottom: 10px;">
  <a href="https://api.aliyun.com/terraform?source=Module&activeTab=document&sourcePath=terraform-alicloud-modules%3A%3Aess-clb&spm=docs.m.terraform-alicloud-modules.ess-clb&intl_lang=EN_US" target="_blank">
    <img alt="Open in AliCloud" src="https://img.alicdn.com/imgextra/i1/O1CN01hjjqXv1uYUlY56FyX_!!6000000006049-55-tps-254-36.svg" style="max-height: 44px; max-width: 100%;">
  </a>
</div></div>

```hcl
module "example" {
  source               = "terraform-alicloud-modules/ess-clb/alicloud"
  create_scaling_group = true
  min_size             = 1
  max_size             = 4
  desired_capacity     = 2
  default_cooldown     = 28
  scaling_group_name   = "your_name"
  vswitch_ids          = ["vswitch_ids"]
  spot_instance_remedy = false
  
  create_slb_balancer            = true
  load_balancer_name             = "your_load_balancer_name"
  load_balancer_spec             = "your_load_balancer_spec"
  address_ip_version             = "ipv4"
  payment_type                   = "PayAsYouGo"
  delete_protection              = "off"
  address_type                   = "internet"
  modification_protection_status = "NonProtection"
  internet_charge_type           = "PayByTraffic"
  
  create_slb_listener   = true
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