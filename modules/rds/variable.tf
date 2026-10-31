variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet_id" {
  description = "Private subnet ID for RDS"
  type        = string
}

variable "app_security_group_id" {
  description = "Security group of the app server allowed to connect to the database"
  type        = string
}

variable "private_subnet_2_id" {
  description = "Second private subnet ID for RDS"
  type        = string
}
