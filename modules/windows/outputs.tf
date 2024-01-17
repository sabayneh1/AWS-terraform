output "windows_instance_ids" {
  value       = aws_instance.this[*].id
  description = "IDs of the created Windows instances."
}

output "windows_instance_dns" {
  value       = aws_instance.this[*].public_dns
  description = "Public DNS names of the Windows instances."
}

output "windows_instance_public_ips" {
  value       = aws_instance.this[*].public_ip
  description = "Public IP addresses of the Windows instances."
}
