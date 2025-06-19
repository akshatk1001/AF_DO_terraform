variable "droplet_name" {
  description = "Name of new droplet"
  type        = string
  default     = "web-1"
}
variable "droplet_tag_id" {
  description = "Tag ID for all droplets that are created"
  type        = string
}

variable "droplet_region" {
  description = "Region for the droplet. SHOULD be the same as region for network"
  type        = string
  default     = "sfo2"
}

variable "vpc_id" {
  description = "UUID of the VPC for the droplet"
  type        = string
}