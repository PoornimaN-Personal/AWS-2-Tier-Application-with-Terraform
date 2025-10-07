variable "private_subnets" {
  description = "List of IDs of Private Subnets to create RDS instances in"
  type = list(string)
}
variable "rds_sg_id" {
    description = "Security Group of RDS DB"
}

variable "db_username" {
  description = "Username for the RDS instance"
  type = string
  default = "admin"
}
variable "db_password" {
  description = "Password for the RDS instance"
  type = string
  default = "Password123!"
}
variable "db_name" {
  description = "Name of the database to create"
  type = string
  default = "mysql"
}
