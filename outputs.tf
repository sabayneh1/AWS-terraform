output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "ID of the VPC."
}

output "public_subnet_ids" {
  value       = module.vpc.public_subnet_ids
  description = "IDs of the public subnets."
}

output "private_subnet_ids" {
  value       = module.vpc.private_subnet_ids
  description = "IDs of the private subnets."
}

# output "ec2_public_ips" {
#   value = [for instance in aws_instance.this : instance.public_ip]
#   description = "Public IP addresses of the EC2 instances."
# }

# output "ec2_public_dns" {
#   value = [for instance in aws_instance.this : instance.public_dns]
#   description = "Public DNS names of the EC2 instances."
# }

# output "ec2_private_ips" {
#   value = [for instance in aws_instance.this : instance.private_ip]
#   description = "Private IP addresses of the EC2 instances."
# }

output "ec2_instance_ids" {
  value       = module.linux_instance.ec2_instance_ids
  description = "IDs of the EC2 instance."
}

output "ec2_public_ip_addresses" {
  value       = module.linux_instance.ec2_public_ip_addresses
  description = "Public IP addresses of the EC2 instances."
}

output "ec2_private_ip_addresses" {
  value       = module.linux_instance.ec2_private_ip_addresses
  description = "Private IP addresses of the EC2 instances."
}

output "ec2_public_dns" {
  value = module.linux_instance.ec2_public_dns
  description = "Public DNS names of the EC2 instances."
}


output "windows_instance_ids" {
  value       = module.windows_instance.windows_instance_ids
  description = "IDs of the created Windows instances."
}

output "windows_instance_dns" {
  value       = module.windows_instance.windows_instance_dns
  description = "Public DNS names of the Windows instances."
}

output "windows_instance_public_ips" {
  value       = module.windows_instance.windows_instance_public_ips
  description = "Public IP addresses of the Windows instances."
}
