module "vpc" {
  source = "/home/sam/terrafrom/aws_ununtuEC2_ansible/modules/vpc"
  vpc_name               = "my-vpc"
  vpc_cidr               = "10.0.0.0/16"
  vpc_azs                = ["ca-central-1a", "ca-central-1b"]
  vpc_enable_nat_gateway = true
  vpc_tags               = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_instance" "this" {
  count = var.windows_instance_count

  ami                  = var.windows_ami
  instance_type        = var.windows_instance_type
  subnet_id            = module.vpc.public_subnet_ids[0]  # Use the first public subnet
  # vpc_security_group_ids = [module.vpc.default_security_group_id]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
