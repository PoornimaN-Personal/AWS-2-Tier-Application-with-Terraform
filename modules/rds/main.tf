
resource "aws_db_subnet_group" "rds_subnet" {
  
  name       = "rds-subnet-group"
  subnet_ids = var.private_subnets
  tags = {
    Name = "rds-subnet-group"
  }

}

resource "aws_db_instance" "rds" {
  
  #identifier              = var.db_name
  engine                  = "mysql"
  instance_class          = "db.t4g.micro"
  allocated_storage       = 20
  username                = var.db_username
  password                = var.db_password
   db_subnet_group_name    = aws_db_subnet_group.rds_subnet.name
  multi_az = false
  vpc_security_group_ids  = [var.rds_sg_id]
  skip_final_snapshot     = true
}




