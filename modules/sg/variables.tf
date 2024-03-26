variable "security_group_name" {
  description = "Name of the AWS security group resource"
  type        = string
  default     = "Jenkins-SG"
}


variable "sg_description" {
  description = "Description of the security group"
  type        = string
  default     = "Allow inbound traffic"
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
  default     = "vpc-0046cb5589d91b75c"
}

variable "ssh_ingress_from_port" {
  description = "Starting port for SSH ingress"
  type        = number
  default     = 22
}

variable "ssh_ingress_to_port" {
  description = "Ending port for SSH ingress"
  type        = number
  default     = 22
}

variable "ssh_cidr_blocks" {
  description = "CIDR blocks for SSH ingress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "jenkins_ingress_port" {
  description = "Port for Jenkins ingress"
  type        = number
  default     = 8080
}

variable "jenkins_cidr_blocks" {
  description = "CIDR blocks for Jenkins ingress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_cidr_blocks" {
  description = "CIDR blocks for egress traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_from_port" {
  description = "Starting port for egress traffic"
  type        = number
  default     = 0
}

variable "egress_to_port" {
  description = "Ending port for egress traffic"
  type        = number
  default     = 0
}

variable "egress_protocol" {
  description = "Protocol for egress traffic"
  type        = string
  default     = "-1"
}

variable "ssh_ingress_protocol" {
  description = "Protocol for SSH ingress"
  type        = string
  default     = "tcp"
}

variable "ssh_description" {
  description = "Description for SSH ingress"
  type        = string
  default     = "SSH"
}

variable "jenkins_ingress_protocol" {
  description = "Protocol for Jenkins ingress"
  type        = string
  default     = "tcp"
}

variable "jenkins_ingress_description" {
  description = "Description for Jenkins ingress"
  type        = string
  default     = "Jenkins"
}

variable "egress_cidr_block_description" {
  description = "Description for egress traffic"
  type        = string
  default     = "Egress traffic"
}