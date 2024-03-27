variable "ami_id" {
    default     = "ami-04a50fb0028227626"
    description = "The AMI to use for the instance"
    type        = string
}

variable "instance_type" {
    default     = "t2.micro"
    description = "The type of instance to start"
    type        = string
}

variable "key_name" {
    default     = "DevSecOpsProject"
    description = "The key name to use for the instance"
    type        = string
}

variable "user_data" {
    #default     = "jenkins-master.sh"
    description = "The user data to provide the instance"
    type        = string
}

variable "public_ip" {
    default     = true
    description = "Whether the instance should have a public IP address"
    type        = bool
}

variable "egress_cidr_blocks" {
    default     = ["0.0.0.0/0"]
    description = "CIDR blocks for egress traffic"
    type        = list(string)
}

variable "tags" {
    default     = {
        Environment  = "Dev"
        Terraform    = "true"
        Project      = "DevOps"
    }
    description = "A map of tags to add to all resources"
    type        = map(string)
}

variable "ebs_block_device_dev" {
  default = {
    device_name             = "/dev/sda1"
    volume_size             = 30
    volume_type             = "gp2"
    delete_on_termination   = true
  }
}

variable "instance_count" {
  description = "Number of instances to deploy"
  type        = number
  default     = 1
}
