output "test_instance_public_ip" {
  value = aws_instance.Terraform-Demo-Test[*].public_ip
}

output "test_instance_dns" {
  value = aws_instance.Terraform-Demo-Test[*].public_dns
}

output "test_instance_id" {
  value = aws_instance.Terraform-Demo-Test[*].id
}
