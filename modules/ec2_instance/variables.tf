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
