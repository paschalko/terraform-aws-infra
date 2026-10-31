variable "ssh_allowed_cidr" {
  description = "Your public IP in CIDR form (e.g. 203.0.113.10/32) to allow SSH. Leave null to disable SSH."
  type        = string
  default     = null
}
