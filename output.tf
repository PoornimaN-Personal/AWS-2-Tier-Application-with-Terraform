output "alb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = module.alb.dns_name
  }

output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = module.rds.rds_endpoint[*]
}

output "public_ips" {
  description = "The IDs of the EC2 instances"
  value       = module.ec2.public_ips
  
}