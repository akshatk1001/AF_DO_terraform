output "vpc_id" {
  description = "ID of the VPC"
  value       = digitalocean_vpc.vpc.id
}