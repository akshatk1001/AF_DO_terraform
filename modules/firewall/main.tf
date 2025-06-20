terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

resource "digitalocean_firewall" "web" {
  name        = "${var.vpc_name}-firewall"
  droplet_ids = [var.droplet_id]

}
