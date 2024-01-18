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
  count                = var.ec2_count
  # name                 = "my-ec2-cluster-${count.index}"
  ami                  = var.ec2_ami
  instance_type        = var.ec2_instance_type
  vpc_security_group_ids = [module.vpc.security_group_id]
  subnet_id            = module.vpc.public_subnet_ids[0]
  tags = {
    Name       = "linux-ec2-cluster-${count.index}"
    Terraform   = "true"
    Environment = "dev"
  }
}
