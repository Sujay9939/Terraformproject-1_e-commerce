resource "aws_subnet" "private_db" {
  count = length(var.private_db_subnet_cidrs)

  vpc_id = aws_vpc.this.id

  cidr_block = var.private_db_subnet_cidrs[count.index]

  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "${var.project_name}-${var.environment}-private-db-${count.index + 1}"

    Environment = var.environment

    Tier = "Database"
  }
}
