variable "ec2_count" {
  type    = number
  default = 2
}

variable "ec2_ami" {
  type    = string
  default = "ami-0fb99f22ad0184043"
}

variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "tags" {
  type    = map(string)
  default = {
    Terraform = "true"
    Environment = "dev"
  }
}
