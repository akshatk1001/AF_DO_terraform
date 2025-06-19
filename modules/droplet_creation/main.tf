terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

resource "digitalocean_droplet" "web" {
  name     = var.droplet_name
  image    = "ubuntu-20-04-x64"
  region   = var.droplet_region
  size     = "s-1vcpu-1gb"
  vpc_uuid = var.vpc_id
  tags     = [var.droplet_tag_id]
}
