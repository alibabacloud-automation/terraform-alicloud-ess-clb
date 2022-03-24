variable "min_size" {
  type        = number
  description = "Minimum number of ECS instances in the scaling group. Value range: [0, 1000]."
  default     = 1
}
variable "max_size" {
  type        = number
  description = "Maximum number of ECS instances in the scaling group. Value range: [0, 1000]."
  default     = 4
}
variable "scaling_group_name" {
  type        = string
  description = "Name shown for the scaling group, which must contain 2-64 characters (English or Chinese), starting with numbers, English letters or Chinese characters, and can contain numbers, underscores _, hyphens -, and decimal points .. If this parameter is not specified, the default value is ScalingGroupId."
  default     = "scaling_group_name"
}

variable "frontend_port" {
  type        = number
  description = "Port used by the Server Load Balancer instance frontend. Valid value range: [1-65535]."
  default     = null
}

variable "protocol" {
  type        = string
  description = "The protocol to listen on. Valid values are [http, https, tcp, udp]."
  default     = "tcp"
}

variable "bandwidth" {
  type        = number
  description = "Valid value is between 1 and 1000, If argument internet_charge_type is PayByTraffic, then this value will be ignore."
  default     = 10
}

variable "spot_instance_remedy" {
  type        = bool
  description = "Whether to replace spot instances with newly created spot/onDemand instance when receive a spot recycling message."
  default     = false
}


variable "health_check_type" {
  type        = string
  description = "Type of health check. Valid values are: tcp and http. Default to tcp . TCP supports TCP and HTTP health check mode, you can select the particular mode depending on your application."
  default     = "tcp"
}

variable "load_balancer_spec" {
  type        = string
  description = "The specification of the Server Load Balancer instance. Default to empty string indicating it is `Shared-Performance` instance. Launching `Performance-guaranteed` instance, it is must be specified and it valid values are: slb.s1.small, slb.s2.small, slb.s2.medium, slb.s3.small, slb.s3.medium, slb.s3.large and slb.s4.large."
  default     = "slb.s1.small"
}


variable "default_cooldown" {
  type        = number
  description = "Default cool-down time (in seconds) of the scaling group. Value range: [0, 86400]. The default value is 300s."
  default     = 20
}

variable "desired_capacity" {
  type        = number
  description = "Expected number of ECS instances in the scaling group. Value range: [min_size, max_size]."
  default     = 2
}

variable "removal_policies" {
  type        = list(string)
  description = "RemovalPolicy is used to select the ECS instances you want to remove from the scaling group when multiple candidates for removal exist."
  default     = ["OldestInstance", "NewestInstance"]
}

variable "health_check_interval" {
  type        = number
  description = "Time interval of health checks. It is required when health_check is on. Valid value range: [1-50] in seconds. Default to 2."
  default     = 4
}

variable "delete_protection" {
  type        = string
  description = "Whether enable the deletion protection or not. on: Enable deletion protection. off: Disable deletion protection. Default to off. Only postpaid instance support this function."
  default     = "off"
}

variable "health_check_timeout" {
  type        = number
  description = "Maximum timeout of each health check response. It is required when health_check is on. Valid value range: [1-300] in seconds. Default to 5."
  default     = 5
}
variable "healthy_threshold" {
  type        = number
  description = "The number of health checks that an unhealthy backend server must consecutively pass before it can be declared healthy. "
  default     = 3
}



variable "modification_protection_status" {
  type        = string
  description = "The status of modification protection. Valid values: ConsoleProtection and NonProtection. Default value is NonProtection."
  default     = "NonProtection"
}


variable "internet_charge_type" {
  type        = string
  description = "Valid values are PayByBandwidth, PayByTraffic. If this value is PayByBandwidth, then argument address_type must be internet. Default is PayByTraffic. If load balancer launched in VPC, this value must be PayByTraffic. Before version 1.10.1, the valid values are paybybandwidth and paybytraffic."
  default     = "PayByTraffic"
}

variable "health_check" {
  type        = string
  description = "Whether to enable health check. Valid values areon and off. TCP and UDP listener's HealthCheck is always on, so it will be ignore when launching TCP or UDP listener."
  default     = "off"
}

variable "health_check_method" {
  type        = string
  description = "HealthCheckMethod used for health check.Valid values: `head`, `get`"
  default     = "get"
}

variable "load_balancer_name" {
  type        = string
  description = "The name of the SLB."
  default     = "load_balancer_name"
}