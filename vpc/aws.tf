
locals {
  terraform_directory = lower(basename(path.cwd))

  resource_prefix = lower("${var.customer}-${var.environment}-${var.aws_region}")

  default_tags = {
    Customer        = var.customer
    Environment     = var.environment
    Team            = var.team
    Organization    = var.organization
    CostCenter      = var.cost_center
    Confidentiality = var.confidentiality
    ManagedBy       = "Terraform"
    TerraformPath   = local.terraform_directory
  }

  merged_tags = merge(local.default_tags, var.extra_tags)
}
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = local.merged_tags
  }
}

