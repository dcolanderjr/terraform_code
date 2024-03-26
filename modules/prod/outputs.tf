output "prod_instance_public_ip" {
    value = aws_instance.Terraform-Demo-Prod[*].public_ip
}

output "prod_instance_dns" {
    value = aws_instance.Terraform-Demo-Prod[*].public_dns
}

output "prod_instance_id" {
    value = aws_instance.Terraform-Demo-Prod[*].id
}
