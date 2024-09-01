variable "region" {
  description = "Target AWS region to deploy workloads in."
  type        = string
  default     = "eu-central-1"
}

variable "db_password" {
  description = "Password for the master database user."
  type        = string
  sensitive   = true
  default = "demoPassword1!"
}

variable "access_key" {
  description = "Access key for AWS."
  type        = string
  sensitive   = true
  default = "<YOUR_VALUE_HERE>"
}

variable "secret_key" {
  description = "Secret Access Key for AWS."
  type        = string
  sensitive   = true
  default = "<YOUR_VALUE_HERE>"
}