
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = { Name = var.name }
}

resource "aws_subnet" "subnet_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidrs[0]
  availability_zone = var.azs[0]
  tags = { Name = "${var.name}-subnet-a" }
}

resource "aws_subnet" "subnet_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidrs[1]
  availability_zone = var.azs[1]
  tags = { Name = "${var.name}-subnet-b" }
}

resource "aws_security_group" "main" {
  name        = "${var.name}-sg"
  description = "Allow all traffic"
  vpc_id      = aws_vpc.main.id

  ingress { 
    from_port = 0 
    to_port = 0 
    protocol = "-1" 
    cidr_blocks = ["0.0.0.0/0"] 
    }
  egress  { 
    from_port = 0 
    to_port = 0 
    protocol = "-1" 
    cidr_blocks = ["0.0.0.0/0"] 
    }

  tags = { Name = "${var.name}-sg" }
}
