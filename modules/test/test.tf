module "sg" {
  source = "../sg"
}

resource "aws_instance" "Terraform-Demo-Test" {
    count                       = var.instance_count
    ami                         = var.ami_id
    instance_type               = var.instance_type
    key_name                    = var.key_name
    security_groups             = [module.sg.security_group_id]
    user_data                   = var.user_data
    associate_public_ip_address = var.public_ip

ebs_block_device {
    device_name             = var.ebs_block_device_test["device_name"]
    volume_size             = var.ebs_block_device_test["volume_size"]
    volume_type             = var.ebs_block_device_test["volume_type"]
    delete_on_termination   = var.ebs_block_device_test["delete_on_termination"]

    tags = merge(var.tags, {
        Name    =  "Terraform-Demo-Test-${count.index + 1}"
    })
    
    }
}
