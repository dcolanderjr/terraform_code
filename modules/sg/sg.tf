resource "aws_security_group" "security_group_name" {
  
  name        = var.security_group_name
  description = var.sg_description
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.ssh_ingress_from_port
    to_port     = var.ssh_ingress_to_port
    protocol    = var.ssh_ingress_protocol
    cidr_blocks = var.ssh_cidr_blocks
    description = var.ssh_description
  }

  ingress {
    from_port   = var.jenkins_ingress_port
    to_port     = var.jenkins_ingress_port
    protocol    = var.jenkins_ingress_protocol
    cidr_blocks = var.jenkins_cidr_blocks
    description = var.jenkins_ingress_description
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks
    description = var.egress_cidr_block_description
  }
}