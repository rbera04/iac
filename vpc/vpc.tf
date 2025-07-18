module "vpc" {
  source               = "../modules/vpc"
  name                 = "${local.resource_prefix}-vpc"
  azs                  = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1]]
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.10.0/24", "10.0.11.0/24"]
}
