output "droplet_id" {
  description = "The ID of the droplet"
  value       = digitalocean_droplet.web.id
}