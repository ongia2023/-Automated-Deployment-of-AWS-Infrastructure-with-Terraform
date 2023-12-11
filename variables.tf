variable "environments" {
  description = "List of environments"
  type        = list(string)
  default     = ["dev", "prod"]
}

variable "instance_type" {
  description = "AWS instance type"
  default     = "t2.micro"
}

variable "ami" {
  description = "Map of AMI IDs for Ubuntu"
  type        = map(string)
  default     = {
    "eu-west-1"     = "ami-0566e623e96d834c4",  # Replace with the appropriate Ubuntu AMI for eu-west-1
    "eu-central-1"  = "ami-00648c36e527032ec"   # Replace with the appropriate Ubuntu AMI for eu-central-1
  }
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "default_region" {
  description = "Default AWS region"
  type        = string
  default     = "eu-west-1"  # Set your preferred default region
}
