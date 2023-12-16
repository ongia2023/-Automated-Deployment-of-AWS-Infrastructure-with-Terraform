#TERRAFORM/modules/route_table/main.tf

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "routes" {
  description = "List of route configurations"
  type        = list(object({
    cidr_block               = string
    gateway_id               = string
    transit_gateway_id       = string
    vpc_peering_connection_id = string
  }))
}

resource "aws_route_table" "main" {
  vpc_id = var.vpc_id

  dynamic "route" {
    for_each = var.routes

    content {
      cidr_block               = route.value.cidr_block
      gateway_id               = route.value.gateway_id
      transit_gateway_id       = route.value.transit_gateway_id
      vpc_peering_connection_id = route.value.vpc_peering_connection_id
    }
  }
}
