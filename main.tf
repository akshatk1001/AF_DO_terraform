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
  source     = "./modules/vpc"
  vpc_name   = var.vpc_name
  vpc_region = var.region
  vpc_CIDR   = var.CIDR
}

resource "digitalocean_tag" "tag" {
  name = var.droplet_tag
}

module "drop" {
  source         = "./modules/droplet_creation"
  droplet_tag_id = digitalocean_tag.tag.id
  droplet_region = var.region
  vpc_id         = module.vpc.vpc_id
  droplet_name   = var.droplet_name
}

module "firewall" {
  source     = "./modules/firewall"
  vpc_name   = var.vpc_name
  droplet_id = module.drop.droplet_id
}