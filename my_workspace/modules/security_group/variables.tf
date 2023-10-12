variable "sg_name" {
  description = "name of the security group"
}

variable "sg_description" {
  description = "description of the security group"
}

variable "vpc_id" {
  description = "id of the vpc where we want to create our security group"
}

variable "ingress_protocol" {
  description = "name of the protocol used to redirect the traffic"
}

variable "egress_protocol" {
  description = "name of the protocol used to redirect the traffic"
}

variable "ingress_http_port" {
  description = "http port number"
}

variable "ingress_https_port" {
  description = "http port number"
}

variable "ingress_ssh_port" {
  description = "ssh port number"
}

variable "egress_port" {
  description = "egress port number"
}

variable "cidr_blocks" {
  description = "value of cidr blocks"
}