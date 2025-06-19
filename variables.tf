variable "vpc_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "test"
}

variable "region" {
  description = "Region for the virtual network"
  type        = string
  default     = "sfo2"
}

variable "CIDR" {
  description = "CIDR for the virtual network (use /24 for subnet)"
  type        = string
}

variable "number_of_subnets" {
  description = "Number of subnets to create (each will be a /24 subnet)"
  type        = number
  default     = 1
}

variable "droplet_tag" {
  description = "The tag for all droplets"
  type        = string
  default     = "web"
}

variable "droplet_name" {
  description = "Name of newly created droplet"
  type        = string
}
