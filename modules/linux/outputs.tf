output "ec2_instance_ids" {
  value = aws_instance.this[*].id
}

output "ec2_public_ip_addresses" {
  value = aws_instance.this[*].public_ip
}

output "ec2_private_ip_addresses" {
  value = aws_instance.this[*].private_ip
}

output "ec2_public_dns" {
  value = [for instance in aws_instance.this : instance.public_dns]
  description = "Public DNS names of the EC2 instances."
}


output "ec2_count" {
  value = var.ec2_count
}
