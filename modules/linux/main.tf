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


resource "aws_iam_role" "ec2_role" {
  count = var.ec2_count
  name  = "app1-ec2-role-${count.index}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "ec2_policy" {
  count       = var.ec2_count
  name        = "example-policy-${count.index}"
  description = "An example IAM policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "ec2:SendSSHPublicKey",
        Resource = "*",
      },
      {
        Effect   = "Allow",
        Action   = "ec2:DescribeInstances",
        Resource = "*",
      },
    ],
  })
}


resource "aws_iam_policy_attachment" "ec2_policy_attachment" {
  count       = var.ec2_count
  name        = "testPolicy-${count.index}"
  policy_arn  = aws_iam_policy.ec2_policy[count.index].arn
  roles       = [aws_iam_role.ec2_role[count.index].name]

}

resource "aws_iam_instance_profile" "ec2_profile" {
  count = var.ec2_count
  name  = aws_iam_role.ec2_role[count.index].name
  role  = aws_iam_role.ec2_role[count.index].name
}


resource "aws_instance" "this" {
  count                = var.ec2_count
  ami                  = var.ec2_ami
  instance_type        = var.ec2_instance_type
  vpc_security_group_ids = [module.vpc.security_group_id]
  subnet_id            = module.vpc.public_subnet_ids[0]
  key_name             = "pro1"
  iam_instance_profile = aws_iam_instance_profile.ec2_profile[count.index].name

  tags = merge(var.tags, {
    Name = "linux-ec2-cluster-${count.index}"
  })

  depends_on = [aws_iam_role.ec2_role]
}




