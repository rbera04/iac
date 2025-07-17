variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
}
variable "customer" { type = string }
variable "environment" { type = string }
variable "team" { type = string }
variable "organization" { type = any }
variable "cost_center" { type = string }
variable "confidentiality" { type = string }

variable "extra_tags" {
  description = "Optional additional tags"
  type        = map(string)
  default     = {}
}
