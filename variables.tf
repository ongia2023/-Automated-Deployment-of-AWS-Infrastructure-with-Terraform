#TERRAFORM/variables.tf
variable "regions" {
  description = "List of AWS regions"
  type        = list(string)
}

variable "availability_zones" {
  description = "AWS availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

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
    "eu-west-1"     = "ami-0566e623e96d834c4",
    "eu-central-1"  = "ami-00648c36e527032ec"
  }
}

variable "default_region" {
  description = "Default AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
}

variable "routes" {
  description = "List of route configurations"
  type        = list(object({
    cidr_block               = string
    gateway_id               = string
    instance_id              = string
    network_interface_ids    = list(string)
    transit_gateway_id       = string
    vpc_peering_connection_id = string
  }))
  default     = []
}
