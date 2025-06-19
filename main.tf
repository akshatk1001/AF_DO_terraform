terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  # save the token locally by doing "export DIGITALOCEAN_TOKEN=secret-token"
}

module "vpc" {
  for_each = { for i in range(var.number_of_subnets) : i => i }

  source       = "./modules/vpc"
  vpc_name     = "${var.vpc_name}-vpc${each.key}"
  vpc_region   = var.region
  vpc_CIDR     = var.CIDR
  subnet_index = each.key
}

resource "digitalocean_tag" "tag" {
  name = var.droplet_tag
}

module "drop" {
  for_each = { for i in range(var.number_of_subnets) : i => i }

  source         = "./modules/droplet_creation"
  droplet_tag_id = digitalocean_tag.tag.id
  droplet_region = var.region
  vpc_id         = module.vpc[each.key].vpc_id
  droplet_name   = "${var.droplet_name}-subnet${each.key}"
}

module "firewall" {
  for_each = { for i in range(var.number_of_subnets) : i => i }

  source     = "./modules/firewall"
  vpc_name   = "${var.vpc_name}-subnet${each.key}"
  droplet_id = module.drop[each.key].droplet_id
}