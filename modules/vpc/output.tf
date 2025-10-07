#Outputs
output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = aws_subnet.public[*].id
}

output "private_subnets" {
  value = aws_subnet.private[*].id
}

output "aws_internet_gateway" {
  value = aws_internet_gateway.igw.id
}

output "aws_nat_gateway" {
  value = aws_nat_gateway.nat.allocation_id
}