variable "project_name" {
  description = "Name of the project"
}
variable "public_subnets" {
  description = "List of subnet IDs to attach to the LB"
  type = list(string)
}

variable "alb_sg_id" {
  description = "Security Group of ALB"
}

variable "vpc_id" {
  description = " Identifier of the VPC in which to create the target group"
}

variable "instance_ids" {
  description = "The Instance ID of EC2 instances to be attached in TG"
}
