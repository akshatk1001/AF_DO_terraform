variable "vpc_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "test"
}

variable "vpc_region" {
  description = "Region for the virtual network"
  type        = string
  default     = "sfo2"
}

variable "vpc_CIDR" {
  description = "CIDR for the virtual network (use /24 for subnet)"
  type        = string
}
