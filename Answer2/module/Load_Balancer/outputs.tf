output "ecs_sg_id" { value = aws_security_group.ecs_sg.id }
output "alb_dns_name" { value = aws_lb.app_alb.dns_name }
