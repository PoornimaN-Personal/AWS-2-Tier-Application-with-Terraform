variable "ami" {
  description = "AMI ID for the EC2 instance"
  type = string
  default = "ami-052064a798f08f0d3" # Amazon Linux 2 (us-east-1 region)
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type = string
  default = "t3.micro"
}
variable "public_subnets" {
  description = "List of IDs of Public Subnets to create EC2 instances in"
  type = list(string)
}

variable "ec2_sg_id" {
  description = "Security Group of EC2"
}

variable "db_host" {
    
}
variable "db_user" {}
variable "db_password" {}
variable "db_name" {}