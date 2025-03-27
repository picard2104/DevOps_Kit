resource "aws_db_instance" "postgres" {
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "17.1"
  instance_class         = "db.t3.micro"
  db_name                = "mydb"
  username               = "dbadmin"
  password               = "test123!!!"
  multi_az               = true
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = [var.rds_sg_id]
  skip_final_snapshot    = true
  tags = { Name = "PostgreSQL-RDS" }
}
