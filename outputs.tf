output "ec2_public_ip" {
  description = "Public IP of the web server"
  value       = module.ec2.public_ip
}

output "db_endpoint" {
  description = "RDS PostgreSQL endpoint"
  value       = module.rds.db_endpoint
}

output "db_master_secret_arn" {
  description = "Secrets Manager ARN holding the RDS master password"
  value       = module.rds.master_user_secret_arn
}
