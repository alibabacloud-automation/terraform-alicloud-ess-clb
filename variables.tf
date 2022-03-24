variable "create_scaling_group" {
  type        = bool
  description = "Whether to create the alicloud_ess_scaling_group"
  default     = false
}

variable "create_slb_balancer" {
  type        = bool
  description = "Whether to create the alicloud_slb_load_balancer"
  default     = false
}

variable "create_slb_listener" {
  type        = bool
  description = "Whether to create the alicloud_slb_listener"
  default     = false
}


variable "balancer_id" {
  type        = string
  description = "The SLB Listener ID"
  default     = ""
}

#alicloud_ess_scaling_group
variable "min_size" {
  type        = number
  description = "Minimum number of ECS instances in the scaling group. Value range: [0, 1000]."
  default     = null
}
variable "max_size" {
  type        = number
  description = "Maximum number of ECS instances in the scaling group. Value range: [0, 1000]."
  default     = null
}

variable "scaling_group_name" {
  type        = string
  description = "Name shown for the scaling group, which must contain 2-64 characters (English or Chinese), starting with numbers, English letters or Chinese characters, and can contain numbers, underscores _, hyphens -, and decimal points .. If this parameter is not specified, the default value is ScalingGroupId."
  default     = null
}

variable "desired_capacity" {
  type        = number
  description = "Expected number of ECS instances in the scaling group. Value range: [min_size, max_size]."
  default     = null
}

variable "default_cooldown" {
  type        = number
  description = "Default cool-down time (in seconds) of the scaling group. Value range: [0, 86400]. The default value is 300s."
  default     = null
}

variable "vswitch_ids" {
  type        = list(string)
  description = "List of virtual switch IDs in which the ecs instances to be launched."
  default     = []
}

variable "removal_policies" {
  type        = list(string)
  description = "RemovalPolicy is used to select the ECS instances you want to remove from the scaling group when multiple candidates for removal exist."
  default     = []
}

variable "db_instance_ids" {
  type        = list(string)
  description = "If an RDS instance is specified in the scaling group, the scaling group automatically attaches the Intranet IP addresses of its ECS instances to the RDS access whitelist."
  default     = []
}

variable "loadbalancer_ids" {
  type        = list(string)
  description = "If a Server Load Balancer instance is specified in the scaling group, the scaling group automatically attaches its ECS instances to the Server Load Balancer instance."
  default     = []
}

variable "multi_az_policy" {
  type        = string
  description = "Multi-AZ scaling group ECS instance expansion and contraction strategy. PRIORITY, BALANCE or COST_OPTIMIZED(Available in 1.54.0+)."
  default     = "PRIORITY"
}

variable "on_demand_base_capacity" {
  type        = number
  description = "he minimum amount of the Auto Scaling group's capacity that must be fulfilled by On-Demand Instances. This base portion is provisioned first as your group scales."
  default     = null
}

variable "on_demand_percentage_above_base_capacity" {
  type        = number
  description = "Controls the percentages of On-Demand Instances and Spot Instances for your additional capacity beyond OnDemandBaseCapacity."
  default     = null
}

variable "spot_instance_pools" {
  type        = number
  description = "The number of Spot pools to use to allocate your Spot capacity. The Spot pools is composed of instance types of lowest price."
  default     = null
}

variable "spot_instance_remedy" {
  type        = bool
  description = "Whether to replace spot instances with newly created spot/onDemand instance when receive a spot recycling message."
  default     = null
}

variable "group_deletion_protection" {
  type        = bool
  description = "Specifies whether the scaling group deletion protection is enabled. true or false, Default value: false."
  default     = null
}
variable "launch_template_id" {
  type        = string
  description = "Instance launch template ID, scaling group obtains launch configuration from instance launch template, see Launch Template. Creating scaling group from launch template enable group automatically."
  default     = null
}
variable "launch_template_version" {
  type        = string
  description = "The version number of the launch template. Valid values are the version number, Latest, or Default, Default value: Default."
  default     = null
}

# alicloud_slb_load_balancer
variable "address" {
  type        = string
  description = "Specify the IP address of the private network for the SLB instance, which must be in the destination CIDR block of the corresponding switch."
  default     = null
}
variable "address_ip_version" {
  type        = string
  description = "The IP version of the SLB instance to be created, which can be set to ipv4 or ipv6 . Default to ipv4. Now, only internet instance support ipv6 address."
  default     = null
}
variable "address_type" {
  type        = string
  description = "The network type of the SLB instance. Valid values: `internet`, `intranet`. If load balancer launched in VPC, this value must be intranet."
  default     = null
}

variable "bandwidth" {
  type        = number
  description = "Valid value is between 1 and 1000, If argument internet_charge_type is PayByTraffic, then this value will be ignore."
  default     = null
}


variable "delete_protection" {
  type        = string
  description = "Whether enable the deletion protection or not. on: Enable deletion protection. off: Disable deletion protection. Default to off. Only postpaid instance support this function."
  default     = null
}
variable "internet_charge_type" {
  type        = string
  description = "Valid values are PayByBandwidth, PayByTraffic. If this value is PayByBandwidth, then argument address_type must be internet. Default is PayByTraffic. If load balancer launched in VPC, this value must be PayByTraffic. Before version 1.10.1, the valid values are paybybandwidth and paybytraffic."
  default     = null
}
variable "load_balancer_name" {
  type        = string
  description = "The name of the SLB."
  default     = null
}

variable "load_balancer_spec" {
  type        = string
  description = "The specification of the Server Load Balancer instance. Default to empty string indicating it is `Shared-Performance` instance. Launching `Performance-guaranteed` instance, it is must be specified and it valid values are: slb.s1.small, slb.s2.small, slb.s2.medium, slb.s3.small, slb.s3.medium, slb.s3.large and slb.s4.large."
  default     = null
}
variable "master_zone_id" {
  type        = string
  description = "The primary zone ID of the SLB instance. If not specified, the system will be randomly assigned. You can query the primary and standby zones in a region by calling the DescribeZone API."
  default     = null
}

variable "modification_protection_reason" {
  type        = string
  description = "The reason of modification protection. It's effective when modification_protection_status is ConsoleProtection."
  default     = null
}
variable "modification_protection_status" {
  type        = string
  description = "The status of modification protection. Valid values: ConsoleProtection and NonProtection. Default value is NonProtection."
  default     = null
}
variable "period" {
  type        = number
  description = "The duration that you will buy the resource, in month. It is valid when PaymentType is Subscription. Default to 1. Valid values: [1-9, 12, 24, 36]. This attribute is only used to create Subscription instance or modify the PayAsYouGo instance to Subscription. Once effect, it will not be modified that means running terraform apply will not affact the resource."
  default     = null
}
variable "payment_type" {
  type        = string
  description = "The billing method of the load balancer. Valid values are PayAsYouGo and Subscription. Default to PayAsYouGo."
  default     = null
}
variable "resource_group_id" {
  type        = string
  description = "The Id of resource group which the SLB belongs."
  default     = null
}
variable "slave_zone_id" {
  type        = string
  description = "The standby zone ID of the SLB instance. If not specified, the system will be randomly assigned. You can query the primary and standby zones in a region by calling the DescribeZone API."
  default     = null
}

# alicloud_slb_listener
variable "load_balancer_id" {
  type        = string
  description = "The Load Balancer ID which is used to launch a new listener."
  default     = null
}
variable "description" {
  type        = string
  description = "The description of slb listener. This description can have a string of 1 to 80 characters. Default value: null."
  default     = null
}

variable "frontend_port" {
  type        = number
  description = "Port used by the Server Load Balancer instance frontend. Valid value range: [1-65535]."
  default     = null
}
variable "backend_port" {
  type        = number
  description = "Port used by the Server Load Balancer instance backend. Valid value range: [1-65535]."
  default     = null
}

variable "protocol" {
  type        = string
  description = "The protocol to listen on. Valid values are [http, https, tcp, udp]."
  default     = null
}

variable "scheduler" {
  type        = string
  description = "Scheduling algorithm, Valid values: wrr, rr, wlc, sch, tcp, qch. Default to wrr. Only when protocol is tcp or udp, scheduler can be set to sch. Only when instance is guaranteed-performance instance and protocol is tcp or udp, scheduler can be set to tch. Only when instance is guaranteed-performance instance and protocol is udp, scheduler can be set to qch."
  default     = null
}

variable "server_group_id" {
  type        = string
  description = "the id of server group to be apply on the listener, is the id of resource alicloud_slb_server_group."
  default     = null
}

variable "master_slave_server_group_id" {
  type        = string
  description = "the master slave server group id"
  default     = null
}

variable "acl_status" {
  type        = string
  description = "Whether to enable `acl(access control list)`, the acl is specified by acl_id. Valid values are on and off. Default to off."
  default     = null
}

variable "acl_type" {
  type        = string
  description = "Mode for handling the acl specified by acl_id. If acl_status is `on`, it is mandatory. Otherwise, it will be ignored. Valid values are white and black. white means the Listener can only be accessed by client ip belongs to the acl; black means the Listener can not be accessed by client ip belongs to the acl."
  default     = null
}

variable "acl_id" {
  type        = string
  description = "the id of access control list to be apply on the listener, is the id of resource alicloud_slb_acl."
  default     = null
}
variable "sticky_session" {
  type        = string
  description = "Whether to enable session persistence, Valid values are on and off. Default to off."
  default     = null
}

variable "sticky_session_type" {
  type        = string
  description = "Mode for handling the cookie."
  default     = null
}

variable "cookie_timeout" {
  type        = number
  description = "Mode for handling the cookie."
  default     = null
}

variable "cookie" {
  type        = string
  description = "The cookie configured on the server."
  default     = null
}

variable "persistence_timeout" {
  type        = number
  description = "Timeout of connection persistence. Valid value range: [0-3600] in seconds. Default to 0 and means closing it."
  default     = null
}

variable "health_check" {
  type        = string
  description = "Whether to enable health check. Valid values areon and off. TCP and UDP listener's HealthCheck is always on, so it will be ignore when launching TCP or UDP listener."
  default     = null
}

variable "health_check_method" {
  type        = string
  description = "HealthCheckMethod used for health check.Valid values: `head`, `get`"
  default     = null
}

variable "health_check_type" {
  type        = string
  description = "Type of health check. Valid values are: tcp and http. Default to tcp . TCP supports TCP and HTTP health check mode, you can select the particular mode depending on your application."
  default     = null
}

variable "health_check_domain" {
  type        = string
  description = "Domain name used for health check. "
  default     = null
}

variable "health_check_uri" {
  type        = string
  description = "URI used for health check."
  default     = null
}

variable "health_check_connect_port" {
  type        = number
  description = "The port that is used for health checks. Valid value range: [0-65535]. Default to 0 means that the port on a backend server is used for health checks."
  default     = null
}

variable "healthy_threshold" {
  type        = number
  description = "The number of health checks that an unhealthy backend server must consecutively pass before it can be declared healthy. In this case, the health check state is changed from fail to success. It is required when health_check is on. Valid value range: [2-10] in seconds. Default to 3. NOTE: This parameter takes effect only if the health_check parameter is set to on."
  default     = null
}

variable "unhealthy_threshold" {
  type        = number
  description = "The number of health checks that a healthy backend server must consecutively fail before it can be declared unhealthy. In this case, the health check state is changed from success to fail. It is required when health_check is on. Valid value range: [2-10] in seconds. Default to 3. NOTE: This parameter takes effect only if the health_check parameter is set to on."
  default     = null
}

variable "health_check_timeout" {
  type        = number
  description = "Maximum timeout of each health check response. It is required when health_check is on. Valid value range: [1-300] in seconds. Default to 5. Note: If health_check_timeout < health_check_interval, its will be replaced by health_check_interval."
  default     = null
}

variable "health_check_interval" {
  type        = number
  description = "Time interval of health checks. It is required when health_check is on. Valid value range: [1-50] in seconds. Default to 2."
  default     = null
}

variable "delete_protection_validation" {
  type        = bool
  description = "Checking DeleteProtection of SLB instance before deleting. If true, this resource will not be deleted when its SLB instance enabled DeleteProtection. Default to false."
  default     = null
}