module "sg" {
  source = "../sg"
}

resource "aws_instance" "Terraform-Demo-Dev" {
    count                       = var.instance_count
    ami                         = var.ami_id
    instance_type               = var.instance_type
    key_name                    = var.key_name
    security_groups             = [module.sg.security_group_id]
    user_data                   = var.user_data
    associate_public_ip_address = var.public_ip

    tags = merge(var.tags, {
        Name    =  "Terraform-Demo-Dev-${count.index + 1}"
    })

ebs_block_device {
    device_name             = var.ebs_block_device_dev["device_name"]
    volume_size             = var.ebs_block_device_dev["volume_size"]
    volume_type             = var.ebs_block_device_dev["volume_type"]
    delete_on_termination   = var.ebs_block_device_dev["delete_on_termination"]

    tags = var.tags

  }
}