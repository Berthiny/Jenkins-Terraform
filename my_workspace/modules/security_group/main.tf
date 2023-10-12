resource "aws_security_group" "jenkinssg" {
  name = var.sg_name
  description = var.sg_description
  vpc_id = var.vpc_id

  ingress {
    from_port = var.ingress_http_port
    to_port = var.ingress_http_port
    protocol = var.ingress_protocol
    cidr_blocks = var.cidr_blocks
  }

  ingress {
    from_port = var.ingress_ssh_port
    to_port = var.ingress_ssh_port
    protocol = var.ingress_protocol
    cidr_blocks = var.cidr_blocks
  }

  ingress {
    from_port = var.ingress_https_port
    to_port = var.ingress_https_port
    protocol = var.ingress_protocol
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port = var.egress_port
    to_port = var.egress_port
    protocol = var.egress_protocol
    cidr_blocks = var.cidr_blocks
  }

}