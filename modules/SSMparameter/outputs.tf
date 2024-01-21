# outputs.tf
output "ssm_parameter_name" {
  value = aws_ssm_parameter.password.name
}
