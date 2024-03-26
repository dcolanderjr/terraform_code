output "dev_instance_public_ip" {
    value = aws_instance.Terraform-Demo-Dev[*].public_ip
}   

output "dev_instance_dns" {
    value = aws_instance.Terraform-Demo-Dev[*].public_dns
}

output "dev_instance_id" {
    value = aws_instance.Terraform-Demo-Dev[*].id
}
