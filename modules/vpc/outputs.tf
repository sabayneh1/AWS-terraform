output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnet[*].id
}

output "security_group_id" {
  value = aws_vpc.my_vpc.default_security_group_id
}


output "windows_security_group_id" {
  value = aws_security_group.windows_security_group.id
}
