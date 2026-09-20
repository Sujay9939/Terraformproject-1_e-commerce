resource "aws_route_table" "private_db" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.project_name}-${var.environment}-private-db-route-table"
  }
}

resource "aws_route_table_association" "private_db" {
  count = length(aws_subnet.private_db)

  subnet_id = aws_subnet.private_db[count.index].id

  route_table_id = aws_route_table.private_db.id
}
