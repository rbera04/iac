variable "name" {
  type        = string
  description = "Name for the VPC"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public subnet CIDRs"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private subnet CIDRs"
}

variable "tags" {
  type    = map(string)
  default = {}
}
