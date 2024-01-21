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


# variable "role_name" {
#   description = "The name of the IAM role"
#   type        = string
# }

# variable "assume_role_policy" {
#   description = "The assume role policy"
#   type        = string
# }


# variable "create_iam_role" {
#   description = "Flag to determine if IAM role and policy should be created"
#   type        = bool
#   default     = true  # Set to true to create the IAM role and policy
# }
