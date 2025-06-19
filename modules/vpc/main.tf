terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

locals {
  # Making sure passed in CIDR is /24
  CIDR_mask_len = split("/", var.vpc_CIDR)[1]
  bits_to_add   = 24 - local.CIDR_mask_len
  new_CIDR      = cidrsubnet(var.vpc_CIDR, local.bits_to_add, 0)
}

resource "digitalocean_vpc" "vpc" {
  name     = var.vpc_name
  region   = var.vpc_region
  ip_range = local.new_CIDR
}