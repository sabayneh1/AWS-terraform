# variable "region" {
#   type    = string
#   default = "ca-central-1" # Change to your desired AWS region
# }

# variable "vpc_name" {
#   type    = string
#   default = "my-vpc"
# }

# variable "vpc_cidr" {
#   type    = string
#   default = "10.0.0.0/16"
# }

# variable "vpc_azs" {
#   type    = list(string)
#   default = ["ca-central-1a", "ca-central-1b", "ca-central-1c"]
# }

# variable "vpc_private_subnets" {
#   type    = list(string)
#   default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
# }

# variable "vpc_public_subnets" {
#   type    = list(string)
#   default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

variable "vpc_name" {
  type    = string
  default = "my-vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_azs" {
  type    = list(string)
  default = ["ca-central-1a", "ca-central-1b"]
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}
# }
variable "private_subnets" {
  type    = list(string)
  default = ["10.0.200.0/24", "10.0.201.0/24"]
}
variable "vpc_enable_nat_gateway" {
  type    = bool
  default = true
}

variable "vpc_tags" {
  type    = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}
