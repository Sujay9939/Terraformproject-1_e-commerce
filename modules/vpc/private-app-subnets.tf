resource "aws_subnet" "private_app" {
  count = length(var.private_app_subnet_cidrs)

  vpc_id = aws_vpc.this.id

  cidr_block = var.private_app_subnet_cidrs[count.index]

  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "${var.project_name}-${var.environment}-private-app-${count.index + 1}"

    Environment = var.environment

    Tier = "Application"
  }
}
