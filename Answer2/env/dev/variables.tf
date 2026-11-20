variable "env" { type = string }
variable "vpc_cidr" { type = string }
variable "ecs_cpu" { type = string }
variable "ecs_memory" { type = string }
variable "desired_count" { type = number }
variable "db_instance_class" { type = string }
variable "allocated_storage" { type = number }
variable "backup_retention_period" { type = number }
variable "deletion_protection" { type = bool }
variable "db_password" {
  type      = string
  sensitive = true
}
