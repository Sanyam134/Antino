variable "env" { type = string }
variable "vpc_id" { type = string }
variable "public_subnet_ids" { type = list(string) }
variable "private_subnet_ids" { type = list(string) }
variable "ecs_cpu" { type = string }
variable "ecs_memory" { type = string }
variable "desired_count" { type = number }
variable "deletion_protection" { type = bool }
