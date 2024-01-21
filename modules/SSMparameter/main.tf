# main.tf
resource "aws_ssm_parameter" "password" {
  name  = "/password/windows_ec2"
  type  = "SecureString"
  value = "your_password_here"
}


# how to retrive the data below command
#aws ssm get-parameter --name "/password/windows_ec2" --with-decryption
#Ensure that the public key associated with the "pro1" key pair is added to the ~/.ssh/authorized_keys file on the Linux EC2 instance.

