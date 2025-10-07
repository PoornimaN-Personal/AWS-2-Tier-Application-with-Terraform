

resource "aws_key_pair" "example" {
  key_name   = "poorni-terraform-project1"  # Replace with your desired key name
  public_key = file("~/.ssh/id_rsa.pub")  # Replace with the path to your public key file
}
resource "aws_instance" "web" {
  count         = length(var.public_subnets)
  ami           = var.ami # Amazon Linux 2 (us-east-1 region)
  instance_type = var.instance_type
  subnet_id     = var.public_subnets[count.index]
  key_name      = aws_key_pair.example.key_name
  vpc_security_group_ids = [ var.ec2_sg_id ]
  //user_data = base64encode(file("./userdata.sh")) 
  //user_data = file(userdata.sh)
  //user_data_base64 = file("userdata.sh")

  //user_data = file("${path.module}/userdata.sh")
  user_data = templatefile("${path.module}/user_data_tpl.sh.tpl", {
    db_host     = var.db_host
    db_user     = var.db_user
    db_password = var.db_password
    db_name     = var.db_name
  })  
  tags = {
    Name = "web-instance-${count.index}"
  }
}

