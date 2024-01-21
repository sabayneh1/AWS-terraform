module "vpc" {
  source = "../vpc"
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
  subnet_id            = module.vpc.public_subnet_ids[0]
  vpc_security_group_ids = [module.vpc.windows_security_group_id]

  user_data = <<-EOF
                <powershell>
                # Fetch password from SSM Parameter Store
                \$password = (Get-SSMParameterValue -Name "/password/windows_ec2" -WithDecryption \$true).Parameters[0].Value

                # Set the administrator password
                net user Administrator \$password

                </powershell>
                EOF

  tags = {
    Name       = "windows-ec2-cluster-${count.index}"
    Terraform   = "true"
    Environment = "dev"
  }
}

