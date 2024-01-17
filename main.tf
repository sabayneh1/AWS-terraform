# provider "aws" {
#   region = var.aws_region
# }

module "vpc" {
  source         = "./modules/vpc"
  vpc_name       = "my-vpc"
  vpc_cidr       = "10.0.0.0/16"
  vpc_azs        = ["ca-central-1a", "ca-central-1b"]
  public_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "linux_instance" {
  source = "./modules/linux"
   # name                 = "my-ec2-cluster-${count.index}"
    # subnet_id = module.vpc.public_subnet_ids[0]
  depends_on = [ module.vpc ]
}


# module "linux_instance" {
#   source            = "./modules/linux"  # Adjust the path accordingly
#   region            = var.aws_region
#   ec2_count         = var.ec2_count
#   ec2_ami           = var.ec2_ami
#   ec2_instance_type = var.ec2_instance_type
#   subnet_id         = module.vpc.public_subnet_ids[0] # Use the first public subnet
# }




























# module "linux" {
#   source = "./modules/linux"
#   #   version                = "~> 2.0"

#   instance_count = 2

#   ami           = "ami-0fb99f22ad0184043"
#   instance_type = "t2.micro"
#   #   key_name               = "user1"
#   #   monitoring             = true
#   #   vpc_security_group_ids = ["sg-12345678"]
#   #   subnet_id              = "subnet-eddcdzz4"

#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#   }
# }


# module "linux" {
#   source = "./modules/linux"

#   linux_instances = {
#     linux-ubuntu-vm  = { instance_type = "t2.micro", ami = "ami-0fb99f22ad0184043" }
#     linux-ubuntu-vm1 = { instance_type = "t2.micro", ami = "ami-0fb99f22ad0184043" }
#   }
# }


