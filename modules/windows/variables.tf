

variable "windows_instance_count" {
  description = "Number of Windows instances to create."
  type        = number
  default     = 2
}

variable "windows_ami" {
  description = "ami-057e9b22dd2a06f68"
  type        = string

}

variable "windows_instance_type" {
  description = "Instance type for Windows instances."
  type        = string
  default     = "t2.micro"  
}
