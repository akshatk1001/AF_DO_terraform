variable "vpc_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "test"
}

variable "droplet_id" {
  description = "ID of the droplet to connect to the firewall"
  type        = string
}