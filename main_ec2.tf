#TERRAFORM/modules/ec2_instance/main.tf

variable "regions" {
  description = "List of AWS regions"
  type        = list(string)
}

variable "availability_zones" {
  description = "AWS availability zones"
  type        = list(string)
}

variable "environments" {
  description = "List of environments"
  type        = list(string)
}

variable "instance_type" {
  description = "AWS instance type"
  type        = string
}

# Updated AMI variable with specific AMIs for each region
variable "ami" {
  description = "Map of AMI IDs for Ubuntu"
  type        = map(string)
  default     = {
    "eu-west-1"    = "ami-0566e623e96d834c4"  # Replace 
    "eu-central-1" = "ami-00648c36e527032ec"
    
  }
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
}

variable "default_region" {
  description = "Default AWS region"
  type        = string
  default     = "eu-west-1"
}

resource "aws_instance" "main" {
  count = length(var.availability_zones)

  ami           = var.ami[var.default_region]
  instance_type = var.instance_type
  subnet_id     = element(var.subnet_ids, count.index)

  tags = {
    Name        = "EC2-${var.default_region}-${var.availability_zones[count.index]}-${var.environments[0]}"
    Environment = var.environments[0]
  }
}

output "public_ips" {
  value = aws_instance.main[*].public_ip
}

output "private_ips" {
  value = aws_instance.main[*].private_ip
}

output "instance_ids" {
  value = aws_instance.main[*].id
}
