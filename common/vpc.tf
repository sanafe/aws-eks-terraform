resource "aws_vpc" "project_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "project-vpc"
  }
}

resource "aws_subnet" "project_subnet" {
  vpc_id = aws_vpc.project_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "project-subnet"
  }
}

resource "aws_internet_gateway" "project_igw" {
  vpc_id = aws_vpc.project_vpc.id
  tags = {
    Name = "project-igw"
  }
}

resource "aws_route_table" "project_rt" {
  vpc_id = aws_vpc.project_vpc.id
}

resource "aws_route" "internet_access" {
  route_table_id = aws_route_table.project_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.project_igw.id
}

resource "aws_route_table_association" "a" {
  subnet_id = aws_subnet.project_subnet.id
  route_table_id = aws_route_table.project_rt.id
}
