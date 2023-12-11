variable "regions" {
  description = "List of AWS regions"
  type        = list(string)
}

variable "availability_zones" {
  description = "AWS availability zones"
  type        = map(list(string))
}

variable "environments" {
  description = "List of environments"
  type        = list(string)
}

variable "instance_type" {
  description = "AWS instance type"
}

variable "ami" {
  description = "Map of AMI IDs for Ubuntu"
  type        = map(string)
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
}

resource "aws_instance" "main" {
  count = length(var.availability_zones)

  ami           = var.ami[var.regions[0]]
  instance_type = var.instance_type

  subnet_id = var.subnet_ids[count.index]

  tags = {
    Name        = "EC2-${var.regions[0]}-${var.availability_zones[var.regions[0]][count.index]}-${var.environments[0]}"
    Environment = var.environments[0]
  }
}

output "public_ips" {
  value = aws_instance.main[*].public_ip
}
