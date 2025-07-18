
output "vpc_id" { value = aws_vpc.main.id }
output "subnet_ids" { value = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id] }
output "security_group_id" { value = aws_security_group.main.id }
output "public_subnet_ids" {
  value = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
}


