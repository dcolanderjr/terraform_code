asg_name                     = "Terraform-ASG"
asg_max_size                 = 4
asg_min_size                 = 1
asg_desired_capacity         = 2
asg_vpc_zone_identifier      = ["${aws_subnet.subnet1.id}", "${aws_subnet.subnet2.id}"]
asg_health_check_type        = "ELB"
asg_health_check_grace_period= 300
asg_termination_policies     = ["OldestInstance"]

lb_name                      = "Terraform-LB"
lb_internal                  = false
lb_type                      = "application"
lb_subnets                   = ["${aws_subnet.subnet1.id}", "${aws_subnet.subnet2.id}"]

tg_name                      = "Terraform-TG"
tg_port                      = 80
tg_protocol                  = "HTTP"
tg_vpc_id                    = var.vpc_id

lt_name                      = "Terraform-LT"
lt_image_id                  = "ami-05d4121edd74a9f06"
lt_key_name                  = "mykey"
lt_user_data                 = "echo 'Hello, World!' > index.html"

instance_type                = "t2.micro"

vpc_id                       = "vpc-0046cb5589d91b75c"
security_group_name          = "terraform_sg"
security_group_description   = "Security group for Terraform"
ingress_protocol             = "tcp"
ingress_ports                = [443, 80, 22]
egress_protocol              = "-1"
egress_ports                 = [0]
cidr_blocks                  = ["0.0.0.0/0"]
region                       = "ca-central-1"
